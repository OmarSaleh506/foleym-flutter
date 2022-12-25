import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  const TextWidget({
    super.key,
    required this.size,
    required this.text,
    required this.color,
    this.fontWeight,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
      ),
    );
  }
}
