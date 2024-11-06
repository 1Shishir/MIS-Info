import 'package:flutter/material.dart';

class IconedText extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconedText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10,),
        Text(text),
      ],
    );
  }
}
