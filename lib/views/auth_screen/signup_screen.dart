import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:roomie_radar/views/auth_screen/firebase_auth.dart';
import 'package:roomie_radar/views/auth_screen/signin_screen.dart';
import 'package:roomie_radar/views/home_screen/home.dart';
import 'package:roomie_radar/views/home_screen/home_screen.dart';
import 'package:roomie_radar/views/reusable_widgets/resuable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final  TextEditingController _passwordTextController = TextEditingController();
  final  TextEditingController _repasswordTextController = TextEditingController();
  final  TextEditingController _emailTextController = TextEditingController();
  final  TextEditingController _userNameTextController = TextEditingController();
  final  TextEditingController _fullNameTextController = TextEditingController();

  final FirebaseAuthService _auth = FirebaseAuthService();
    final _firebase = FirebaseAuth.instance;
  /*Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(),
        password: _passwordTextController.text.trim()
    );
  }*/

  void _submit() async
  {
    try{
    final userCredentials = await _firebase.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text);
        /*Navigator.push(context,
            MaterialPageRoute(builder:  (context)=> const HomeScreen()));*/
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              color: Color.fromARGB(255, 1, 27, 36),
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFCDD9F4),
                Color(0xFFF0F2F6),
                Color(0xFFEBEEF6),
                Color(0xFFEFF1F6),
                Color(0xFFCDD9F4),
                Color(0xFFF0F2F6),
              ],
            ),
          ),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Your Full Name", Icons.person_outline,
                    false, _fullNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Your UserName", Icons.person_outline,
                    false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Your Email Id", Icons.alternate_email,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Your Password", Icons.lock_outlined,
                    true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Retype Your Password", Icons.lock_outlined,
                    true, _repasswordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(
                  context,
                  false,
                    _submit,
                  /*{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Home()));
                  },*/
                ),
                signInOption(context),
              ],
            ),
          ))),
    );
  }

  void _signUp() async {
    String username = _userNameTextController.text;
    String password = _passwordTextController.text;
    String email = _emailTextController.text;
    String fullName = _fullNameTextController.text;

    try {
      UserCredential userCredential = await _firebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Create a new document in the "users" collection with the user data
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'fullName': fullName,
          'email': email,
          // Add any other user data you want to store
        });

        print('User created');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        print('Some error');
      }
    } on FirebaseAuthException catch (e) {
      print('Error signing up: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Authentication failed')),
      );
    } catch (e) {
      print('Error signing up: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }
}

Row signInOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Already have an account?",
          style: TextStyle(color: Color.fromARGB(255, 2, 38, 52))),
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  SignInScreen()));
        },
        child: const Text(
          " Log in",
          style: TextStyle(
              color: Color.fromARGB(255, 2, 38, 52),
              fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
