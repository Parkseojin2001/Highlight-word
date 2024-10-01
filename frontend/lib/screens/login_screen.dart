import 'package:flutter/material.dart';
import 'package:frontend/screens/find_screen.dart';
import 'package:frontend/screens/join_screen.dart';
import 'package:frontend/widgets/input_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffEDDFE0),
        appBar: AppBar(
          backgroundColor: const Color(0xffEDDFE0),
          title: const Text(
            "Login",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w600,
              color: Color(0xff705C53),
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
                    height: 65,
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
                    category: "password",
                    label: 'Enter your Password',
                    controller: _passwordController,
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
                      "SIGN IN",
                      style: TextStyle(
                          color: Color(0xffF5F5F7),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const JoinScreen()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff705C53),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FindScreen()),
                            );
                          },
                          child: const Text(
                            "Find P/W",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff705C53),
                            ),
                          ),
                        ),
                      ],
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
    final password = _passwordController.text;
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String text = 'Success Login';
    RegExp regExp = RegExp(pattern);

    if (email == '' || password == '') {
      text = "❗️ Fill in all fields";
    } else if (!regExp.hasMatch(email)) {
      text = "❌ Invaild email format.";
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
                "Login",
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
