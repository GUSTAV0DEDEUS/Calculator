import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {},
      child: Text(content, style: TextStyle(fontSize: 30)),
      style: const ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll<Color>(Color.fromRGBO(244, 67, 54, .2)),
      ),
    );
  }
}
