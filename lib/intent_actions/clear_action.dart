import 'package:flutter/material.dart';
import 'package:shortcuts_two/intent_actions/clear_intent.dart';
import 'package:shortcuts_two/state/app_state.dart';

class ClearAction extends Action<ClearIntent> {
  final AppState appState;
  ClearAction(this.appState);
  @override
  void invoke(ClearIntent intent) {
    debugPrint("Clearing indicator");
    appState.setIndicator(null);
  }
}
