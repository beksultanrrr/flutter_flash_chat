import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final TextStyle? textStyle;
  final String text;
  const ElevatedButtonWidget({
    Key? key,
    this.onTap,
    this.color,
    this.textStyle,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
            style: color == null
                ? null
                : ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: onTap,
            child: Text(
              text,
              style: textStyle,
            )));
  }
}
