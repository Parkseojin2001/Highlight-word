import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/screens/home_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff87A2FF),
          title: const Text(
            "Test",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          leading: IconButton(
            padding: const EdgeInsets.only(left: 10),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
