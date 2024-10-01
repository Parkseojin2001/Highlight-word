import 'package:flutter/material.dart';
import 'package:frontend/screens/login_screen.dart';

import '../widgets/input_widget.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordcheckController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffEDDFE0),
        appBar: AppBar(
          backgroundColor: const Color(0xffEDDFE0),
          title: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w600,
              color: Color(0xff705C53),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            color: const Color(0xff705C53),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InputWidget(
                    name: "Name",
                    category: 'text',
                    label: "Enter your name",
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputWidget(
                    name: "Email",
                    category: "email",
                    label: "Enter your E-mail",
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InputWidget(
                    name: 'Password',
                    category: 'password',
                    label: 'Enter your Password',
                    controller: _passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InputWidget(
                    name: "Re-enter password",
                    category: "password",
                    label: "Enter your password again",
                    controller: _passwordcheckController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () => RaisedMessage(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB7B7B7),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 130, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Color(0xffF5F5F7),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RaisedMessage() {
    final email = _emailController.text;
    final name = _nameController.text;
    final password = _passwordController.text;
    final check = _passwordcheckController.text;
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String text = 'Congratulations 🥳';
    RegExp regExp = RegExp(pattern);

    if (name == '' || email == '' || password == '' || check == '') {
      text = "❗️ Fill in all fields";
    } else if (!regExp.hasMatch(email)) {
      text = "❌ Invaild email format.";
    } else if (password != check) {
      text = "❌ Not match password.";
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Join",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff705C53),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff705C53),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
