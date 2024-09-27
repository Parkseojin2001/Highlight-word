import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String category;
  final String label;
  final double boxSize;
  final TextEditingController controller;

  const InputWidget({
    required this.category,
    required this.label,
    required this.boxSize,
    required this.controller,
    super.key,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.category,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xff705C53)),
        ),
        SizedBox(
          width: widget.boxSize,
        ),
        Expanded(
          child: TextField(
            controller: widget.controller,
            obscureText: widget.category == 'PW' && _isObscured,
            decoration: InputDecoration(
              labelText: widget.label,
              filled: true,
              fillColor: const Color(0xffF5F5F7),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              suffixIcon: widget.category == 'PW'
                  ? IconButton(
                      color: const Color(0xff705C53),
                      icon: Icon(_isObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      onPressed: () {
                        setState(
                          () {
                            _isObscured = !_isObscured;
                          },
                        );
                      },
                    )
                  : null,
            ),
            keyboardType: widget.category == 'E-mail'
                ? TextInputType.emailAddress
                : TextInputType.text,
          ),
        ),
      ],
    );
  }
}
