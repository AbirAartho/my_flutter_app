import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class loginAPI extends StatefulWidget {
  const loginAPI({super.key});

  @override
  State<loginAPI> createState() => _loginAPIState();
}

class _loginAPIState extends State<loginAPI> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final String login = 'http://http://192.168.20.46:8080/api/auth/signin';

  void loginData() async {
    var reqBody = {
      "username": emailTextEditingController.text,
      "password": passwordTextEditingController.text
    };

    var response = await http.post(Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody));

    var jsonResponse = jsonDecode(response.body);
    const storage = const FlutterSecureStorage();
    await storage.write(key: 'token', value: jsonResponse ['jwtToken']);
    print(jsonResponse);
    print(response.statusCode);
  }

  void postData() async {}

  void putData() async {}

  void deleteData() async {}

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              Image(
                image: AssetImage("images/EnvCareLogo-3.png"),
                // image: NetworkImage("https://single.erestro.me/uploads/media/2023/rider_login_screen_(1).png"),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                "Staff Login",
                style: TextStyle(fontSize: 25, fontFamily: "bolt-semibold"),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 14.0,
                        ),
                        hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 12, 21, 73)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                      side: BorderSide(color: Colors.red)))),
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "bolt-semibold",
                                color: Color.fromARGB(255, 243, 242, 242)),
                          ),
                        ),
                      ),
                      onPressed: () {
                        loginData();
                        if (!emailTextEditingController.text.contains("@")) {
                          displayToastMessage("Invalid email. ",);
                        } else if (passwordTextEditingController.text.length < 6) {
                          displayToastMessage("Invalid password. ",);
                        } else {
                          displayToastMessage(emailTextEditingController.text + " " + passwordTextEditingController.text);
                          Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                        }
                      },
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/signup", (route) => false);
                  },
                  child: Text("Do not have an account? Register here"))
            ],
          ),
        ),
      ),
    );
  }
  void displayToastMessage(String s) {}
}
