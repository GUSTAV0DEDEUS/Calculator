import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:calculator/controller/calculator.controller.dart';
import 'package:calculator/view/components/button.dart';
import 'package:flutter/material.dart';

class Standard extends StatefulWidget {
  final CalculatorController controller;
  const Standard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<Standard> createState() => _StandardState();
}

class _StandardState extends State<Standard> {

 bool isResultVisible = false;
  String resultText = "";
  @override
  Widget build(BuildContext context) {
    String resultText = "";
    
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeTextField(
                      controller: widget.controller.displayTextController,
                      enabled: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800,
                      ),
                      presetFontSizes: const [30, 24, 18],
                      maxLines: 3,
                    ),
                    if (isResultVisible) Text(resultText),
                    actions(widget.controller.onBackspaceButtonPressed),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    // line 1
                    Button(
                      onPressed: () {
                        widget.controller.onClearButtonPressed();
                      },
                      content: 'C',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('(');
                      },
                      content: '\u0028',
                      primaryColor: Colors.blueGrey,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed(')');
                      },
                      content: ' \u0029',
                      primaryColor: Colors.blueGrey,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('/');
                      },
                      content: '\u00F7',
                      primaryColor: Colors.blueGrey,
                      secondaryColor: null,
                    ),
                    // line 2
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('7');
                      },
                      content: '7',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('8');
                      },
                      content: '8',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('9');
                      },
                      content: '9',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('*');
                      },
                      content: '\u00D7',
                      primaryColor: Colors.blueGrey,
                      secondaryColor: null,
                    ),
                    // line 3
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('4');
                      },
                      content: '4',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('5');
                      },
                      content: '5',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('6');
                      },
                      content: '6',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('-');
                      },
                      content: '\u002D',
                      primaryColor: Colors.blueGrey,
                      secondaryColor: null,
                    ),
                    // line 4
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('1');
                      },
                      content: '1',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('2');
                      },
                      content: '2',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('3');
                      },
                      content: '3',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('+');
                      },
                      content: '\u002B',
                      primaryColor: Colors.blueGrey,
                      secondaryColor: null,
                    ),
                    // line 5
                    Button(
                      onPressed: () {
                        null;
                      },
                      content: '+/-',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('0');
                      },
                      content: '0',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('.');
                      },
                      content: '\u002C',
                      primaryColor: null,
                      secondaryColor: null,
                    ),
                    Button(
                 onPressed: () {
                       
                        setState(() {
                          resultText = "${widget.controller.onPressedCalculate()}";
                        });
                      
                        },
                      content: '\u003D',
                      primaryColor: Colors.white,
                      secondaryColor: Colors.blueGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column actions(Function removeToTextField) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.history),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.grid_view_outlined),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.calculate_outlined),
                ),
              ],
            ),
            IconButton(
              onPressed: () => {removeToTextField()},
              icon: const Icon(Icons.backspace_outlined),
            ),
          ],
        ),
        const Divider(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
