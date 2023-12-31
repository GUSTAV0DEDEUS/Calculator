import 'package:calculator/controller/calculator.controller.dart';
import 'package:calculator/view/standard/standard.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late CalculatorController controller;
  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller = CalculatorController(
      context: context,
      displayTextController: _textController,
    );
  }
@override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? Standard(controller: controller) : Standard(controller: controller);
  }
}
