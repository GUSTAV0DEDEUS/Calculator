import 'package:flutter/material.dart';

class CalculatorModel {
  final TextEditingController _textController;
  CalculatorModel(this._textController);

  static bool _isNumber(String value) {
    try {
      double.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  void addToTextField(String value, Function() alert) {
    String currentText = _textController.text;

    bool isNumeric = _isNumber(value);
    bool isDivisionSymbol = value == '÷';
    bool isMultiplicationSymbol = value == '×';

    if (isNumeric) {
      bool isLastCharacterNumeric = currentText.isNotEmpty &&
          _isNumber(currentText[currentText.length - 1]);

      if (isLastCharacterNumeric) {
        int numberStartIndex = currentText.lastIndexOf(RegExp(r'[+\-×÷/]')) + 1;
        int currentNumberLength = currentText.length - numberStartIndex;

        if (currentNumberLength >= 10) {
          alert();
          return;
        }
      }
    } else if (isDivisionSymbol || isMultiplicationSymbol) {
      if (currentText.isNotEmpty &&
          (currentText[currentText.length - 1] == '÷' ||
              currentText[currentText.length - 1] == '×')) {
        return;
      }
    } else {
      bool isLastCharacterSymbol = currentText.isNotEmpty &&
          "+-×÷/".contains(currentText[currentText.length - 1]);

      if (isLastCharacterSymbol) {
        return;
      }
    }
    currentText += value;
    _textController.text = currentText;
  }

  void toggleSignLastCharacter() {
    List<String> currentText = _textController.text.split("");
    int index = 0;
    if (_isNumber(currentText[currentText.length - 1])) {
      if (_isNumber(currentText[currentText.length - 2])) {
        index = currentText.length - 2;
        currentText.insert(index, "-");
      } else {
        if (currentText[currentText.length - 2] == "-") {
          currentText[currentText.length - 2] = "+";
        } else {
          index = currentText.length - 2;
          currentText.insert(index, "-");
        }
      }
    }
    String value = currentText.join();
    _textController.text = value;
  }

  void removeLastCharacter(Function() alert) {
    String currentText = _textController.text;
    if (currentText.isNotEmpty) {
      int len = currentText.length;
      String value = currentText.substring(0, len - 1);
      currentText = value;
      _textController.text = currentText;
    } else {
      alert();
    }
  }

  void clearTextField() {
    _textController.text = "";
  }
}
