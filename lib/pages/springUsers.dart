import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/model/users.dart';

class SpringUsers extends StatefulWidget {
  const SpringUsers({super.key});

  @override
  State<SpringUsers> createState() => _dataListState();
}

class _dataListState extends State<SpringUsers> {
  late List<Users>? _userModel = [];

  final String login = "http://192.168.20.46:8080/api/users";

  void _getData() async {
    const storage = FlutterSecureStorage();
    try {
      var value = await storage.read(key: 'token');

      print("------value------");
      print(value);

      var response = await http.get(Uri.parse(login), headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $value"
      });

      _userModel = userFromJson(response.body);
      Future.delayed(const Duration(seconds: 1))
          .then((value) => setState(() {}));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointed Patients:"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/login", (route) => false);
            },
            icon: Icon(Icons.ac_unit),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/home", (route) => false);
            },
            icon: Icon(Icons.ac_unit_outlined),
          ),
        ],
      ),
      body: _userModel == null
          ? const Center(
              child: LinearProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, Index) {
                  return ListTile(
                    // leading: FlutterLogo(size: 72.0),
                    leading: Icon(Icons.person),
                    title: Text(_userModel![Index].username.toString()),
                    subtitle: Text(_userModel![Index].email.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
    );
  }
}