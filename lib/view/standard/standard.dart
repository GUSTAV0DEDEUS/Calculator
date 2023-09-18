import 'package:calculator/view/components/button.dart';
import 'package:flutter/material.dart';

class Standard extends StatelessWidget {
  const Standard({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const TextField(
                      enabled: false,
                      decoration: InputDecoration(
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
                  children: const [
                    // line 1
                    Button(
                      content: 'C',
                    ),
                    Button(
                      content: '\u0028 \u0029',
                    ),
                    Button(
                      content: '\u0025',
                    ),
                    Button(
                      content: '\u00F7',
                    ),
                    // line 2
                    Button(
                      content: '7',
                    ),
                    Button(
                      content: '8',
                    ),
                    Button(
                      content: '9',
                    ),
                    Button(
                      content: '\u00D7',
                    ),
                    // line 3
                    Button(
                      content: '4',
                    ),
                    Button(
                      content: '5',
                    ),
                    Button(
                      content: '6',
                    ),
                    Button(
                      content: '\u002D',
                    ),
                    // line 4
                    Button(
                      content: '1',
                    ),
                    Button(
                      content: '2',
                    ),
                    Button(
                      content: '3',
                    ),
                    Button(
                      content: '\u002B',
                    ),
                    // line 5
                    Button(
                      content: '+/-',
                    ),
                    Button(
                      content: '0',
                    ),
                    Button(
                      content: '\u002C',
                    ),
                    Button(
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
