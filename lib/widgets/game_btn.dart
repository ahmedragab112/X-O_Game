import 'package:flutter/material.dart';

class GameBtn extends StatelessWidget {
  const GameBtn({super.key, required this.color, required this.txt, required this.function});
  final Color color;
  final String txt;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        padding: const EdgeInsets.all(20),
        child: Text(txt,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center),
      ),
    );
  }
}
