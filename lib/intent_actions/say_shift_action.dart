import 'package:flutter/material.dart';
import 'say_shift_intent.dart';

class SayShiftAction extends Action<SayShiftIntent> {
  @override
  Object? invoke(SayShiftIntent intent) {
    debugPrint("Saying 'Shift'");
    return null;
  }
}
