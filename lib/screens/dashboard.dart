import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_project_auth/screens/login_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
    emailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;
    
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  emailVerification();
                },
                child: const Text('Verify login status!')),
                const SizedBox(height: 20,),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 8, 107, 188),
                ),
                onPressed: () {
                  const Login_page();
                },
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Log out'),
              ),
            ),
          ],
        ),
      )
    );
  }
}