import 'package:flutter/material.dart';
import 'package:shortcuts_two/intent_actions/say_caps_lock_intent.dart';

import '../state/app_state.dart';

class SayCapsLockAction extends Action<SayCapsLockIntent> {
  final AppState appState;
  SayCapsLockAction(this.appState);
  @override
  void invoke(SayCapsLockIntent intent) {
    debugPrint("Caps-Lock pressed");
    appState.setIndicator(Icon(Icons.lock_outline_rounded));
  }
}
