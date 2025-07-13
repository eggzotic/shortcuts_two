import 'package:flutter/material.dart';
import 'package:shortcuts_two/state/app_state.dart';
import 'say_shift_intent.dart';

class SayShiftAction extends Action<SayShiftIntent> {
  final AppState appState;
  SayShiftAction(this.appState);
  @override
  void invoke(SayShiftIntent intent) {
    debugPrint("Saying 'Shift'");
    appState.setIndicator(Icon(Icons.arrow_upward));
  }
}
