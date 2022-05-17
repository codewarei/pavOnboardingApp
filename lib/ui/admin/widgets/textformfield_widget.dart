import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {

  final IconData? icon;
  final String? hint;

  const TextFormWidget({ this.icon, this.hint});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF4A4A54),
        ),
        child: TextField(

          maxLength: 100,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
              suffixIcon: Icon(
                icon,
                color: Colors.grey,
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              border: InputBorder.none),
        ),
      );
  }
}