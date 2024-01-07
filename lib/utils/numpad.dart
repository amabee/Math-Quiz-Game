import 'package:flutter/material.dart';
import 'package:math_game/utils/const.dart';

// ignore: must_be_immutable
class NumPadButton extends StatelessWidget {
  NumPadButton({super.key, required this.numpy, required this.onTap});

  final String numpy;
  final VoidCallback onTap;
  var buttonColor = const Color(0XFF508D69);

  @override
  Widget build(BuildContext context) {
    if (numpy == "C") {
      buttonColor = Colors.lightGreen;
    } else if (numpy == "DEL") {
      buttonColor = Colors.redAccent;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            color: buttonColor,
            child: Center(
              child: Text(
                numpy,
                style: whiteStyleText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
