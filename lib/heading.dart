import 'package:flutter/material.dart';

class Heading extends StatelessWidget {

  final String text;
  final int level;

  const Heading(this.text, {Key? key, this.level = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = level <= 4 ? (5 * (6 - level)).toDouble() : 14;
    return Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(text, style: TextStyle(fontSize: size)),
    );
  }
}
