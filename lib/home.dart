import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter_app/service/firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final FirestoreService fs = FirestoreService();
final TextEditingController txc = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  void openNoteBox(String? docId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: txc,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      fs.addNote(txc.text);
                      print(txc.text);
                      txc.clear();
                      //close the box
                      Navigator.pop(context);
                    },
                    child: const Text("Add"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FireBase!!",
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(null),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fs.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = noteList[index];
                String dockId = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];
                String noteTime = data['timestamp'].toString();

                return ListTile(
                  title: Text(noteText),
                  subtitle: Text(noteTime),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => openNoteBox(dockId),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          fs.deleteNode(dockId);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text("No Notes founds");
          }
        },
      ),
    );
  }
}
