import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.content,
    required this.onPressed,
    required this.primaryColor,
    required this.secondaryColor,
    required this.weight,
  });
  final String content;
  final VoidCallback onPressed;
  final Color? primaryColor;
  final Color? secondaryColor;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            secondaryColor ?? const Color.fromRGBO(244, 67, 54, .2)),
      ),
      child: Text(
        content,
        style: GoogleFonts.poppins(
          fontSize: 30,
          color: primaryColor ?? const Color.fromRGBO(244, 67, 54, 1),
          fontWeight: weight ?? FontWeight.w500,
        ),
      ),
    );
  }
}
