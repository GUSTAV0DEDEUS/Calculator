import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.content, required this.onPressed, required this.primaryColor, required this.secondaryColor});
  final String content;
  final VoidCallback onPressed;
  final Color? primaryColor; 
  final Color? secondaryColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            secondaryColor ?? const Color.fromRGBO(244, 67, 54, .2)),
      ),
      child: Text(content, style: TextStyle(fontSize: 30, color: primaryColor ?? const Color.fromRGBO(244, 67, 54, 1))),
    );
  }
}
