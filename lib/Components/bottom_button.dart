import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final VoidCallback onTap;
  final String buttonTitle;

  BottomButton(this.buttonTitle,this.onTap);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle,style: BoldTextStyle,)),
        color: kBottomcontainercolor,
        padding: EdgeInsets.only(bottom: 15),
        margin: EdgeInsets.only(top: 20),
        height: kBottomcontainerheight,
        width: double.infinity,
      ),
    );
  }
}