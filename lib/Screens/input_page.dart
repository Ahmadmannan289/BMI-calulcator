import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../Components/resusable_card.dart';
import '../Components/gender_function.dart';
import '../constants.dart';
import '../Components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.male);
                          print('Male button was pressed');
                        });
                      },
                      child: ReusableCard(
                        malecardcolor,
                        IconContent(FontAwesomeIcons.mars, 'Male'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.female);
                          print('Female button pressed');
                        });
                      },
                      child: ReusableCard(femalecardcolor,
                          IconContent(FontAwesomeIcons.venus, 'Female')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
                    kInactivecardcolor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: SliderTextstyle,
                            ),
                            Text(
                              'cm',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            overlayColor: Color(0x29EB1555),
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 100.0,
                              max: 220.0,
                              onChanged: (double newval) {
                                setState(() {
                                  height = newval.round();
                                });
                              }),
                        )
                      ],
                    ))),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        kInactivecardcolor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: SliderTextstyle,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                SizedBox(
                                  width: 20,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                      kInactivecardcolor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: SliderTextstyle,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 17.0,
                              ),
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(
                                width: 20,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              'Calculate',
              () {
                CalculatorBrain calc = CalculatorBrain(height, weight);

                Navigator.pushNamed(context, Argumentpassing.routeName,
                    arguments: ArgumentsIMC(
                        calc.CalculateBMI(),
                        calc.GetResults(),
                        calc.GetInterpretation()));
              },
            ),
          ],
        ));
  }
}

//we have built a reusable function namely ReusableCard which makes the function as shown above of the container element which prevents the dry running of overall code.
//Go to Flutter Outline and select the build class by CTRL+CLICK to open inspector, then right click
//the Container function and select extract widget to transform it into a function.

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpressed;
  RoundIconButton(this.icon, this.onpressed);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 6.0,
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
