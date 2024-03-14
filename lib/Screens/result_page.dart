import '../constants.dart';
import 'package:flutter/material.dart';
import '../Components/resusable_card.dart';
import '../Components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage(this.bmiResult,this.resultText,this.resultInterpretation);

  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                'YOUR RESULTS',
                style: TitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActivecardcolor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: ResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    resultInterpretation,
                    style: bmiBodyStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton('RE-CALCULATE', () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}

class Argumentpassing extends StatelessWidget {
  static const routeName = '/extractArguments';
  const Argumentpassing({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsIMC;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                'YOUR RESULTS',
                style: TitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActivecardcolor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    args.resultText.toUpperCase(),
                    style: ResultTextStyle,
                  ),
                  Text(
                    args.bmiResult,
                    style: bmiTextStyle,
                  ),
                  Text(
                    args.resultInterpretation,
                    style: bmiBodyStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton('RE-CALCULATE', () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
  }



class ArgumentsIMC {
  final String bmiResult;
  final String resultText;
  final String resultInterpretation;

  ArgumentsIMC( this.bmiResult, this.resultText, this.resultInterpretation);
}


