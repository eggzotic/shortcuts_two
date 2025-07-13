import 'package:flutter/material.dart';

class Section {
  static int _nextSection = 0;
  int number;
  final String title;
  Widget content;

  Section({String? title, Widget? content})
    : number = _nextSection,
      title = title ?? "Section $_nextSection",
      content =
          content ?? Center(child: Text("Section $_nextSection content")) {
    _nextSection++;
  }
}
