import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      this.borderRadius,
      required this.text,
      required this.textStyle,
      this.onPressed});

  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final String text;
  final TextStyle textStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    borderRadius ?? const BorderRadius.all(Radius.circular(12)),
              )),
          child: Text(
            text,
            style: textStyle,
          )),
    );
  }
}
