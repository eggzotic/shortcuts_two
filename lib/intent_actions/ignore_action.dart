import 'package:flutter/material.dart';

class IgnoreAction extends Action<EditableTextTapOutsideIntent> {
  @override
  void invoke(EditableTextTapOutsideIntent intent) {
    // FocusManager.instance.primaryFocus?.unfocus();
    // FocusManager.instance.primaryFocus?.nearestScope?.requestFocus();
    FocusManager.instance.rootScope.requestScopeFocus();
  }
}
