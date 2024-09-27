import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff87A2FF),
          title: const Text(
            "HighLight Words",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          leading: const IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: null,
          ),
          actions: const [
            IconButton(
              padding: EdgeInsets.only(right: 10),
              onPressed: null,
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Text(
                      "Hello NickName",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Vocabulary: {total_count}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 90),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffC4D7FF),
                        padding: const EdgeInsets.all(50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "My Profile",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffFFD7C4),
                          padding: const EdgeInsets.all(50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )),
                      onPressed: () {},
                      child: const Text(
                        "VOCA",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFFF4B5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 160, vertical: 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Test",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
