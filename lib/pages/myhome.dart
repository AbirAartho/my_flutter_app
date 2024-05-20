import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/pages/bodyMain.dart';


class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EnvCare"),
        centerTitle: true,

        // leading: const Icon(Icons.account_balance_sharp),
        actions: [
        // IconButton(
        //     onPressed: () {
        //       print("aaaa");
        //     },
        //     icon: Icon(Icons.account_balance_sharp)),
        // IconButton(
        //     onPressed: () {
        //       print("bbbb");
        //     },
        //     icon: Icon(Icons.account_balance_wallet)),
        // IconButton(
        //     onPressed: () {
        //       print("aaaa");
        //     },
        //     icon: Icon(Icons.account_balance_sharp)),
        IconButton(
               onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => true);
          print("Login Button Clicked");
        },
            icon: Icon(Icons.logout)),
        ],
      ),
      // body: Center(
      //   child: Text(
      //       "Get all medical services. Take treatment from home. Book your appointment. Our team is ready to welcome you"),
      // ),

      // body: PracticeN2(),
       body: BodyMain(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(197, 139, 227, 227),
                ),
                child: Center(
                  child: Text('EnvCare',
                      style:
                          TextStyle(fontSize: 35, fontFamily: "bolt-semibold")),
                )),
            ListTile(
              title: Text("Home"),
              subtitle: Text("Home Page"),
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              // trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Staff List"),
              subtitle: Text("See staff list..."),
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              // trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Water Sample Analysis"),
              subtitle: Text("Water sample analysis data..."),
              leading: CircleAvatar(
                // child: Icon(Icons.info_rounded),
                 child: IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/springUsers", (route) => true);
                        print("Users Button Clicked");
                      },
                      icon: Icon(Icons.water)),
              ),
              // trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Soil Sample Analysis"),
              subtitle: Text("Soil sample analysis data..."),
              leading: CircleAvatar(
                child: Icon(Icons.data_array),
              ),
              // trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Air Sample Analysis"),
              subtitle: Text("Air sample analysis data..."),
              leading: CircleAvatar(
                child: Icon(Icons.air),
              ),
              // trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Extra Features"),
              subtitle: Text("Extra features..."),
              leading: CircleAvatar(
                child: Icon(Icons.offline_bolt),
              ),
              // trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text("Staff Signup"),
              subtitle: Text("Confirn your signup..."),
              leading: CircleAvatar(
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/signup", (route) => true);
                      print("Signup Button Clicked");
                    },
                    icon: Icon(Icons.arrow_forward)),
              ),
              // trailing: Icon(Icons.account_circle),
            ),
            // ListTile(
            //     title: Text("Appointment"),
            //     subtitle: Text("Book an appointment.."),
            //     leading: CircleAvatar(
            //       child: IconButton(
            //           onPressed: () {
            //             Navigator.pushNamedAndRemoveUntil(
            //                 context, "/firebase", (route) => true);
            //             print("Firebase Button Clicked");
            //           },
            //           icon: Icon(Icons.timer)),
            //     )
            //     // trailing: Icon(Icons.account_circle),
            //     ),
          ],
        ),
      ),
      // endDrawer: Container(),
      // bottomNavigationBar: Container(),// AppBer button is not working
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamedAndRemoveUntil(context, "/myLoginScreen", (route) => true);
      //     print("Login Button Clicked");
      //   },
      //   elevation: 0,
      //   child: Icon(Icons.logout),
      //   backgroundColor: Colors.greenAccent,
      // ),
    );
  }
}