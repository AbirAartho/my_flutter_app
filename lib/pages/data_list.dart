import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/model/users.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
//  class  _data_list createState() => _data_list();
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  void deleteData() async {
    var response = await http.delete(
        Uri.parse(login + '/1'),
        headers: {"Content-Type": 'application/json'},
    );
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    print(response.statusCode);
  }
  
  late List<Users>? _userModel = [];

  final String login = 'https://demo-application-lcpr.onrender.com';

  void _getData() async {
    const storage = FlutterSecureStorage();

    try {
      var value = await storage.read(key: 'token');
      print("---");

      var response = await http.get(Uri.parse(login), headers: {
        "Content-Type": "application/json",
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
    super.initState();
    _getData();
  }

  @override
  Widget _getProductList(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example for Post'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (route) => false);
              },
              icon: Icon(Icons.ac_unit_outlined)),
        ],
      ),
      body: _userModel == null
          ? const Center(
              child: LinearProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(_userModel![index].username.toString()),
                    subtitle: Text(_userModel![index].email.toString()),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return _getProductList(context);
  }
}
