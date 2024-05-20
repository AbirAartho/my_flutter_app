import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/firebase_options.dart';
import 'package:my_flutter_app/home.dart';
import 'package:my_flutter_app/pages/bodyMain.dart';
import 'package:my_flutter_app/pages/create.dart';
import 'package:my_flutter_app/pages/data_list.dart';
import 'package:my_flutter_app/pages/login.dart';
import 'package:my_flutter_app/pages/myhome.dart';
import 'package:my_flutter_app/pages/page1.dart';
import 'package:my_flutter_app/pages/page2.dart';
import 'package:my_flutter_app/pages/page3.dart';
import 'package:my_flutter_app/pages/springUsers.dart';
import 'package:my_flutter_app/rest_abi_call/rest_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => loginAPI(),
        "/home": (context) => MyHome(),
        "/home2": (context) => Home2(),
        "/signup": (context) => FormPage2(),
        "/firebase": (context) => MyHomePage(),
        "/api": (context) => ApiLoginScreen(),
        "/springUsers": (context) => SpringUsers(),
        "/bodyMain": (context) => BodyMain(),
        "/page1": (context) => Page1(),
        "/page2": (context) => Page2(),
        "/page3": (context) => Page3(),
      },
    );
  }
}
