import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiLoginScreen extends StatefulWidget {
  const ApiLoginScreen({Key? key}) : super(key: key);

  @override
  State<ApiLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ApiLoginScreen> {




  Map<String, String> get headers => <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  final String login = 'https://api.restful-api.dev/objects';

  void getData(BuildContext context) async {
   
      var response = await http.get(Uri.parse(login),
          headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        // var myToken = jsonResponse['jwtToken'];
        print(jsonResponse);
       
      } else {
        print('Something went wrong');
      } 
  }

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
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                "Login as a Staff",
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
              
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: "bolt-semibold",
                                color: Colors.white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // if (!emailTextEditingController.text.contains("@")) {
                        //   displayToastMessage("Invalid email. ", context);
                        // } else if (passwordTextEditingController.text.length <
                        //     5) {
                        //   displayToastMessage("Invalid password. ", context);
                        // } else {
                        //
                        // }
                        print("-----------------------");

                        getData(context);

                        print("-----------------------");

                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, "/", (route) => false);
                    // print("Registered Button Clicked");
                  },
                  child: Text("Do not have a Account? Register Here"))
            ],
          ),
        ),
      ),
    );
  }
}




//
// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);
//   static const String idScreen = "login";
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController passwordTextEditingController = TextEditingController();
//   bool _isNotValided = false;
//   late SharedPreferences prefs;
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initSharedPref();
//   }
//
//   void initSharedPref() async{
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   final String login = 'https://jsonplaceholder.typicode.com';
//   void _login() async {
//     if (emailTextEditingController.text.isNotEmpty &&
//         passwordTextEditingController.text.isNotEmpty) {
//       var reqBody = {
//         "userName": emailTextEditingController.text,
//         "pass": passwordTextEditingController.text,
//       };
//
//       var response = await http.post(Uri.parse(login),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(reqBody));
//
//       var jsonResponse = jsonDecode(response.body);
//       if (jsonResponse['status']) {
//         var myToken = jsonResponse['token'];
//         prefs.setString('token', myToken);
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => Dashboard(token: myToken)));
//       } else {
//         print('Something went wrong');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 35.0,
//               ),
//               Image(
//                 image: AssetImage("images/logo.png"),
//                 width: 390.0,
//                 height: 250.0,
//                 alignment: Alignment.center,
//               ),
//               SizedBox(
//                 height: 1.0,
//               ),
//               Text(
//                 "Login as a Rider",
//                 style: TextStyle(fontSize: 25, fontFamily: "bolt-semibold"),
//                 textAlign: TextAlign.center,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 1.0,
//                     ),
//                     TextField(
//                       controller: emailTextEditingController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         labelStyle: TextStyle(
//                           fontSize: 14.0,
//                         ),
//                         // hintText: "Email",
//                         hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
//                       ),
//                       style: TextStyle(fontSize: 14.0),
//                     ),
//                     SizedBox(
//                       height: 1.0,
//                     ),
//                     TextField(
//                       controller: passwordTextEditingController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: "Password",
//                         labelStyle: TextStyle(
//                           fontSize: 14.0,
//                         ),
//                         // hintText: "Email",
//                         hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
//                       ),
//                       style: TextStyle(fontSize: 14.0),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     TextButton(
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.yellow),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(24.0),
//                             // side: BorderSide(color: Colors.red)
//                           ))),
//                       child: Container(
//                         height: 50.0,
//                         child: Center(
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontFamily: "bolt-semibold",
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         if (!emailTextEditingController.text.contains("@")) {
//                           displayToastMessage("Invalid email. ", context);
//                         } else if (passwordTextEditingController.text.length <
//                             6) {
//                           displayToastMessage("Invalid password. ", context);
//                         } else {
//                           loginAndAuthenticateUser(context);
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.pushNamedAndRemoveUntil(
//                         context, RegistrationScreen.idScreen, (route) => false);
//                     // print("Registered Button Clicked");
//                   },
//                   child: Text("Do not have a Account? Register Here"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   loginAndAuthenticateUser(BuildContext context) async {
//     // print("-----------------------");
//
//     final User? user = (await _firebaseAuth
//             .signInWithEmailAndPassword(
//                 email: emailTextEditingController.text,
//                 password: passwordTextEditingController.text)
//             .catchError((errMsg) {
//       displayToastMessage("Error: " + errMsg.toString(), context);
//     }))
//         .user;
//
//     if (user != null) {
//       print("-----------------------");
//       usersRef.child(user.uid).once().then((value) => (DataSnapshot snap) {
//             if (snap.value != null) {
//               Navigator.pushNamedAndRemoveUntil(
//                   context, MainScreen.idScreen, (route) => false);
//               displayToastMessage("Logged-in", context);
//             } else {
//               _firebaseAuth.signOut();
//               displayToastMessage("User Not Exists. Please Sign-up.", context);
//             }
//           });
//     } else {
//       displayToastMessage("Something is wrong!!", context);
//     }
//   }
// }
