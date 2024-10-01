import 'package:flutter/material.dart';

import '../widgets/input_widget.dart';
import 'login_screen.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({super.key});

  @override
  State<FindScreen> createState() => _FindScreenState();
}

class _FindScreenState extends State<FindScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffEDDFE0),
        appBar: AppBar(
          backgroundColor: const Color(0xffEDDFE0),
          title: const Text(
            "Find P/W",
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
                    height: 65,
                  ),
                  InputWidget(
                    name: "Name",
                    category: 'text',
                    label: "Enter your name",
                    controller: _nameController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputWidget(
                    name: "Email",
                    category: "email",
                    label: "Enter your E-mail",
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () => RaisedMessage(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB7B7B7),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 125, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Find P/W",
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
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    String text = "";
    RegExp regExp = RegExp(pattern);

    if (email == '' || name == '') {
      text = "❗️ Fill in all fields";
    } else if (!regExp.hasMatch(email)) {
      text = "❌ Invaild email format.";
    } else {
      text = "Password: ";
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
                "Find P/W",
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
