import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorBrain{
  CalculatorBrain(this.height,this.weight);
  final int height;
  final int weight;

  double _bmi=10;

  String GetInterpretation(){

    if(_bmi>=25)
    {
      return 'Ah, the epitome of perfection! Behold, the majestic creature whose gravitational pull'
          ' rivals that of a small moon. Their generous curves and bulging waistlines create an '
          'undeniable aura of magnificence. Truly, they are a shining example of defying gravity '
          'and embracing the art of expansion.';
    }
    else if(_bmi>=18 && _bmi<25)
    {
      return 'Ah, behold the ordinary mortals, those who neither shock nor awe. They reside in the '
          'realm '
          'of the average, where mediocrity reigns supreme. Their bodies are neither excessively '
          'plump nor astoundingly'
          ' thin, creating an underwhelming aura of just being... well, normal. How enchanting it'
          ' must be to be so unremarkable in the realm of body measurements.';
    }
    else
    {
      return 'Oh, look at this ethereal being! So fragile, so delicate, as if a gust of wind'
          ' could whisk them away to a land of calorie abundance. Their slender frame is an '
          'exquisite masterpiece, a testament to the power of the invisible buffet and the art '
          'of forgetting to eat. Truly, they are the embodiment of weightlessness.';
    }

  }



  String CalculateBMI(){
    _bmi= weight/pow(height/100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String GetResults(){
    if(_bmi>=25)
      {
        return 'Overweight!!';
      }
    else if(_bmi>=18 && _bmi<25)
      {
        return 'Normal';
      }
    else
      {
        return 'Underweight!!';
      }
  }



}