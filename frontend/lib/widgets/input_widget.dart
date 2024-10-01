import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String name;
  final String category;
  final String label;
  final TextEditingController controller;

  const InputWidget({
    required this.name,
    required this.category,
    required this.label,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff705C53)),
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: widget.controller,
          obscureText: (widget.category == 'password') && _isObscured,
          decoration: InputDecoration(
            labelText: widget.label,
            filled: true,
            fillColor: const Color(0xffF5F5F7),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            suffixIcon: widget.category == 'password'
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
          keyboardType: widget.category == 'email'
              ? TextInputType.emailAddress
              : TextInputType.text,
        ),
      ],
    );
  }
}
