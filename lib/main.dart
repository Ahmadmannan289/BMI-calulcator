import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
import 'Screens/result_page.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/calculator_brain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //below code prevents distortion in landscape mode......
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        Argumentpassing.routeName: (context) =>Argumentpassing(),
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(color: Colors.black54),
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   appBarTheme: AppBarTheme(color: Colors.black54),
      //   scaffoldBackgroundColor: Colors.blueGrey,
      //   textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.red))
      //
      // ),
    );
  }
}