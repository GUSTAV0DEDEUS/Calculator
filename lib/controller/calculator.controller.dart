import 'package:calculator/model/calculator.model.dart';
import 'package:flutter/material.dart';

class CalculatorController {
  final BuildContext context;
  final TextEditingController textController;
  late CalculatorModel model;

  CalculatorController({
    required this.context,
    required this.textController,
  }) {
    model = CalculatorModel(textController);
  }

  void onBackspaceButtonPressed() {
    model.removeLastCharacter(
        () => showSnackbar(message: "Nao ha caractere para remover"));
  }

  void onClearButtonPressed() {
    model.clearTextField();
  }

  void onButtonPressed(String value) {
    model.addToTextField(
        value,
        () => showSnackbar(
            message:
                "Nao e possivel inserir um numero com mais de 10 algarismos"));
  }

  void onButtonToggleSign() {
    model.toggleSignLastCharacter();
  }

  void showSnackbar({String? message}) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height / 1.4,
        left: 20,
        right: 20,
      ),
      backgroundColor: Colors.red[200],
      elevation: 0,
      content: Text(message ?? ""),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
