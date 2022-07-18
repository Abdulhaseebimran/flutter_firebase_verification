import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_firebase_project_auth/screens/login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey _SignKey = GlobalKey<FormState>();

// final nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwprdController = TextEditingController();

Future<void> SignUp () async {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  // Name: nameController.text.trim(),
  email: emailController.text.trim(), 
  password: passwprdController.text.trim());

  signup() async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwprdController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignUp"),centerTitle: true,),
      // backgroundColor: Color.fromARGB(255, 104, 187, 255),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Flutter Authentication",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Email Address",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwprdController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
             const SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 2, 108, 195),
                        ),
                        child: const Text('Sign up'),
                        onPressed: () {
                          SignUp();
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Already have an account?'),
                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login_page()),
                          );
                        },
                      )
          ],
        ),
          ],
      ),
      
     ) );
  }
}