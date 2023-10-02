import 'package:calculator/model/calculator.model.dart';
import 'package:flutter/material.dart';

class CalculatorController {
  final BuildContext context;
  final TextEditingController displayTextController;
  late CalculatorModel model;
  String innerText = "";
  CalculatorController({
    required this.context,
    required this.displayTextController,
  }) {
    model = CalculatorModel(displayTextController);
  }

  void onBackspaceButtonPressed() {
    model.removeLastCharacter();
  }

  void onClearButtonPressed() {
    model.clearTextField();
  }

  void onButtonPressed(String value) {
    model.addToTextField(
        value,
        () => showSnackbar(
            message:
                "Não é possível inserir um número com mais de 10 algarismos"));
  }

  double onPressedCalculate() {
    innerText = displayTextController.text;
    try {
      final result = model.calculate();
      return result;
    } catch (e) {
      showSnackbar(message: "Erro de cálculo");
      return 0;
    }
  }

  void updateTextController(String text) {
    displayTextController.text = text;
  }

  void lastSymbolController() {
    model.lastSymbol();
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
