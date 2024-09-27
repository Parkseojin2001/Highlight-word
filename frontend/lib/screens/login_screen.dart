import 'package:flutter/material.dart';
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
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Color(0xff705C53),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            child: Column(
              children: [
                const SizedBox(
                  height: 65,
                ),
                InputWidget(
                  category: "E-mail",
                  label: "Enter your E-mail",
                  boxSize: 20,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputWidget(
                  category: 'PW',
                  label: 'Enter your Password',
                  boxSize: 55,
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    print('Email: $email');
                    print('PassWord: $password');
                  },
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
                      const TextButton(
                        onPressed: null,
                        child: Text(
                          "Search P/W",
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
    );
  }
}
