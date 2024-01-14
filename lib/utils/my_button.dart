import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.onButtonPressed,
    required this.icons, required this.buttonColor,
  });

  final Color buttonColor;
  final IconData icons;

  VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 60),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: const Color.fromARGB(255, 194, 53, 53).withOpacity(0.5),
        onTap: onButtonPressed,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(
              width: 3,
              color: const Color.fromARGB(255, 194, 53, 53)
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icons,
            size: 38,
            color: const Color.fromARGB(255, 194, 53, 53),
          ),
        ),
      ),
    );
  }
}
