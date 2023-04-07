import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
// declaring variables
  final color;
  final textColor;
  final String? buttonText;
  final GestureTapCallback? onTap;

//Constructor
  MyButton({this.color, this.textColor, this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText!,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
