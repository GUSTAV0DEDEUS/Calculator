import 'package:flutter/material.dart';

class CalculatorModel {
  final TextEditingController _textController;
  late String text = _textController.text;
  CalculatorModel(this._textController);
  late List<String> stack = text.split("");

  
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
    bool isDivisionSymbol = value == '/';
    bool isMultiplicationSymbol = value == '*';

    if (isNumeric) {
      bool isLastCharacterNumeric = currentText.isNotEmpty &&
          _isNumber(currentText[currentText.length - 1]);

      if (isLastCharacterNumeric) {
        int numberStartIndex = currentText.lastIndexOf(RegExp(r'[-+*/]')) + 1;
        int currentNumberLength = currentText.length - numberStartIndex;

        if (currentNumberLength >= 10) {
          alert();
          return;
        }
      }
    } else if (isDivisionSymbol || isMultiplicationSymbol || value == "+" || value == "-") {
      if (currentText.isEmpty ||
          "+-".contains(currentText[currentText.length - 1]) ||
          currentText[currentText.length - 1] == "(") {
        return;
      }

      if (currentText.isNotEmpty &&
          (currentText[currentText.length - 1] == '/' ||
              currentText[currentText.length - 1] == '*')) {
        return;
      }
    } else if (value == "(") {
      if (currentText.isNotEmpty &&
          (_isNumber(currentText[currentText.length - 1]) ||
              currentText[currentText.length - 1] == "(")) {
        return;
      }
    } else if (value == ")") {
      if (currentText.isEmpty ||
          !_isNumber(currentText[currentText.length - 1])) {
        return;
      }

      int openParenthesesCount = 0;
      int closeParenthesesCount = 0;

      for (int i = 0; i < currentText.length; i++) {
        if (currentText[i] == "(") {
          openParenthesesCount++;
        } else if (currentText[i] == ")") {
          closeParenthesesCount++;
        }
      }

      if (closeParenthesesCount >= openParenthesesCount) {
        return;
      }
    } else {
      bool isLastCharacterSymbol = currentText.isNotEmpty &&
          "+-*/".contains(currentText[currentText.length - 1]);

      if (isLastCharacterSymbol) {
        return;
      }
    }
    currentText += value;
    _textController.text = currentText;
  }



  void removeLastCharacter() {
    String currentText = _textController.text;
    if (currentText.isNotEmpty) {
      int len = currentText.length;
      String value = currentText.substring(0, len - 1);
      currentText = value;
      _textController.text = currentText;
    }
  }


  void clearTextField() {
    _textController.text = "";
  }

   int _getOperatorPrecedence(String operator) {
    if (operator == "+" || operator == "-") {
      return 1;
    } else if (operator == "*" || operator == "/") {
      return 2;
    }
    return 0;
  }

 List<String> _convertToRPN(List<String> list) {
  List<String> temp = [];
  List<String> operatorStack = [];

  for (int i = 0; i < list.length; i++) {
    String token = list[i].trim();

    if (token.isEmpty) {
      continue;
    } else if (_isNumber(token)) {
      // Construir números maiores que um dígito
      String number = token;
      while (i + 1 < list.length && _isNumber(list[i + 1])) {
        i++;
        number += list[i];
      }
      temp.add(number);
    } else if (token.startsWith('-') && _isNumber(token.substring(1))) {
      temp.add(token);
    } else if (token == "(") {
      operatorStack.add(token);
    } else if (token == ")") {
      while (operatorStack.isNotEmpty && operatorStack.last != "(") {
        temp.add(operatorStack.removeLast());
      }
      if (operatorStack.isNotEmpty && operatorStack.last == "(") {
        operatorStack.removeLast();
      } else {
        throw Exception("Malformed expression");
      }
    } else {
      while (operatorStack.isNotEmpty &&
          operatorStack.last != "(" &&
          _getOperatorPrecedence(token) <=
              _getOperatorPrecedence(operatorStack.last)) {
        temp.add(operatorStack.removeLast());
      }
      operatorStack.add(token);
    }
  }

  while (operatorStack.isNotEmpty) {
    if (operatorStack.last == "(") {
      throw Exception("Malformed expression");
    }
    temp.add(operatorStack.removeLast());
  }

  return temp;
}

double calculate() {
  List<String> rpn = _convertToRPN(stack);
  List<double> numbers = [];

  for (String token in rpn) {
    if (_isNumber(token) || (token.startsWith('-') && _isNumber(token.substring(1)))) {
      numbers.add(double.parse(token));
    } else {
      if (numbers.length < 2) {
        throw Exception("Malformed expression");
      }

      double b = numbers.removeLast();
      double a = numbers.removeLast();

      double result;
      switch (token) {
        case "+":
          result = a + b;
          break;
        case "-":
          result = a - b;
          break;
        case "*":
          result = a * b;
          break;
        case "/":
          result = a / b;
          break;
        default:
          throw Exception("Invalid operator: $token");
      }

      numbers.add(result);
    }
  }

  if (numbers.length != 1) {
    throw Exception("Malformed expression");
  }
  return numbers[0];
}

}
