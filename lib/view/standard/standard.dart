import 'package:calculator/view/components/button.dart';
import 'package:flutter/material.dart';

class Standard extends StatelessWidget {
  const Standard({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    void _addToTextField(String value) {
      String currentText = _textController.text;
      currentText += value;
      _textController.text = currentText;
    }

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
                    TextField(
                      controller: _textController,
                      enabled: false,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    actions(),
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
                        _addToTextField('C');
                      },
                      content: 'C',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u0028');
                      },
                      content: '\u0028',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u0029');
                      },
                      content: ' \u0029',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u00F7');
                      },
                      content: '\u00F7',
                    ),
                    // line 2
                    Button(
                      onPressed: () {
                        _addToTextField('7');
                      },
                      content: '7',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('8');
                      },
                      content: '8',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('9');
                      },
                      content: '9',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u00D7');
                      },
                      content: '\u00D7',
                    ),
                    // line 3
                    Button(
                      onPressed: () {
                        _addToTextField('4');
                      },
                      content: '4',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('5');
                      },
                      content: '5',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('6');
                      },
                      content: '6',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u002D');
                      },
                      content: '\u002D',
                    ),
                    // line 4
                    Button(
                      onPressed: () {
                        _addToTextField('1');
                      },
                      content: '1',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('2');
                      },
                      content: '2',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('3');
                      },
                      content: '3',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u002B');
                      },
                      content: '\u002B',
                    ),
                    // line 5
                    Button(
                      onPressed: () {
                        _addToTextField('C');
                      },
                      content: '+/-',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('0');
                      },
                      content: '0',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u002C');
                      },
                      content: '\u002C',
                    ),
                    Button(
                      onPressed: () {
                        _addToTextField('\u003D');
                      },
                      content: '\u003D',
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

  Column actions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.history),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.grid_view_outlined),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.calculate_outlined),
                ),
              ],
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.backspace_outlined),
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
