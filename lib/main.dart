import 'package:calculator/view/calculator.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  lightDynamic?.primary ?? Colors.blue),
            ),
          ),
          colorScheme: lightDynamic,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                  lightDynamic?.primary ?? Colors.blue),
            ),
          ),
          brightness: Brightness.dark,
          useMaterial3: true,
          colorScheme: darkDynamic,
        ),
        home: const Calculator(),
      );
    });
  }
}
