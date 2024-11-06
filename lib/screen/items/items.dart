import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  final String name;
  final String designation;
  final Color color;

  const Items({
    super.key,
    required this.name,
    required this.designation,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
              color: Colors.black26,
            ),
          ]),
      child: ListTile(
        title: Text(name,style: const TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text(designation),
      ),
    );
  }
}
