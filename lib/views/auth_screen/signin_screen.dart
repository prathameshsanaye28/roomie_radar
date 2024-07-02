
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomie_radar/consts/strings.dart';
import 'package:roomie_radar/views/auth_screen/signup_screen.dart';
import 'package:roomie_radar/views/home_screen/home.dart';
import 'package:roomie_radar/views/reusable_widgets/resuable_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final _firebase = FirebaseAuth.instance;

  void _submit() async{
    if (_emailTextController.text.isEmpty || _passwordTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both email and password')),
      );
      return; // Stop execution if fields are empty
    }
    try{
      final userCredentials = await _firebase.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  const Home()));
    }
    on FirebaseAuthException catch(error){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(217, 217, 236, 255),
              Color.fromARGB(215, 216, 229, 255),
              Color(0xD5D5E9FF),
              Color(0xB9B9D9FF),
              Color.fromARGB(149, 214, 238, 252),
              Color.fromARGB(217, 217, 229, 255),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png", 210.0, 210.0),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Your Email", Icons.person_outline,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Your Password", Icons.lock_outline,
                    true, _passwordTextController),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                signInSignUpButton(context, true, () {
                  _submit();
                }),
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't have an account?",
        style: TextStyle(color: Color.fromARGB(255, 2, 38, 52)),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(
              color: Color.fromARGB(255, 2, 38, 52),
              fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
