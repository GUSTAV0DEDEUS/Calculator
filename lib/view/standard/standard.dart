import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:calculator/controller/calculator.controller.dart';
import 'package:calculator/view/components/button.dart';
import 'package:calculator/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    double height = MediaQuery.of(context).size.height - 80;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AutoSizeTextField(
                          controller: widget.controller.displayTextController,
                          enabled: false,
                          fullwidth: false,
                          textAlign: TextAlign.end,
                          minLines: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.w600,
                          ),
                          presetFontSizes: const [38, 32, 26],
                          maxLines: 2,
                        ),
                        if (isResultVisible)
                          Visibility(
                            visible: isResultVisible,
                            child: GestureDetector(
                              onTap: () => {
                                setState(() {
                                  isResultVisible = false;
                                  widget.controller
                                      .updateTextController(resultText);
                                  resultText = "";
                                })
                              },
                              child: Text(
                                resultText,
                                style: GoogleFonts.poppins(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  actions(widget.controller.onBackspaceButtonPressed),
                ],
              ),
              SizedBox(
                width: 400,
                height: height < 1200 ? height * 0.6 : double.maxFinite,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: height > 800
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    // line 1
                    Button(
                      onPressed: () {
                        widget.controller.onClearButtonPressed();
                        setState(() {
                          resultText = "";
                          isResultVisible = false;
                        });
                      },
                      content: 'C',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('(');
                      },
                      content: '\u0028',
                      primaryColor: Theme.of(context).colorScheme.background,
                      secondaryColor: null,
                      weight: FontWeight.w600,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed(')');
                      },
                      content: ' \u0029',
                      primaryColor: Theme.of(context).colorScheme.background,
                      secondaryColor: null,
                      weight: FontWeight.w600,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('/');
                      },
                      content: '\u00F7',
                      primaryColor: Theme.of(context).colorScheme.background,
                      secondaryColor: null,
                      weight: FontWeight.w600,
                    ),
                    // line 2
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('7');
                      },
                      content: '7',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('8');
                      },
                      content: '8',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('9');
                      },
                      content: '9',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('*');
                      },
                      content: '\u00D7',
                      primaryColor: Theme.of(context).colorScheme.background,
                      secondaryColor: null,
                      weight: FontWeight.w600,
                    ),
                    // line 3
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('4');
                      },
                      content: '4',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('5');
                      },
                      content: '5',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('6');
                      },
                      content: '6',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('-');
                      },
                      content: '\u002D',
                      primaryColor: Theme.of(context).colorScheme.background,
                      secondaryColor: null,
                      weight: FontWeight.w800,
                    ),
                    // line 4
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('1');
                      },
                      content: '1',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('2');
                      },
                      content: '2',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('3');
                      },
                      content: '3',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('+');
                      },
                      content: '\u002B',
                      primaryColor: Theme.of(context).colorScheme.background,
                      secondaryColor: null,
                      weight: FontWeight.w600,
                    ),
                    // line 5
                    Button(
                      onPressed: () {
                        widget.controller.lastSymbolController();
                      },
                      content: '+/-',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('0');
                      },
                      content: '0',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        widget.controller.onButtonPressed('.');
                      },
                      content: '\u002C',
                      primaryColor: null,
                      secondaryColor: null,
                      weight: null,
                    ),
                    Button(
                      onPressed: () {
                        try {
                          final result = widget.controller.onPressedCalculate();
                          setState(() {
                            isResultVisible = true;
                            resultText = result.toString();
                          });
                        } catch (e) {
                          widget.controller
                              .showSnackbar(message: "Erro de cálculo");
                        }
                      },
                      content: '\u003D',
                      primaryColor: Theme.of(context).colorScheme.background,
                      secondaryColor: Theme.of(context).colorScheme.secondary,
                      weight: FontWeight.w600,
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
                Tooltip(
                  message: "Historico",
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.history),
                  ),
                ),
                const SizedBox(width: 10),
                Tooltip(
                  message: "Mais opcoes",
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.grid_view_outlined),
                  ),
                ),
                const SizedBox(width: 10),
                Tooltip(
                  message: "Calculadora cientifica",
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.calculate_outlined),
                  ),
                ),
                const SizedBox(width: 10),
                Tooltip(
                  message: "Perfil",
                  child: IconButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Profile(),
                    )),
                    icon: const Icon(Icons.person_outline_sharp),
                  ),
                ),
              ],
            ),
            Tooltip(
              message: "Apagar",
              child: IconButton(
                onPressed: () => {removeToTextField()},
                icon: const Icon(Icons.backspace_outlined),
              ),
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
