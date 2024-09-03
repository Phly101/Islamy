import 'package:flutter/material.dart';
class  VerseContent extends StatelessWidget {
  String content;
  int index;



  VerseContent (this.content, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$content (${index + 1})",
      textDirection:  TextDirection.rtl,
      style: const TextStyle(
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
}
