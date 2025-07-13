import 'package:flutter/material.dart';

/// An action that does nothing. Somehow it's different to the built-in
/// DoNothingAction (as-in it is usable with EditableTextTapOutsideIntent).
/// It's intent (pun accepted) is to be used with EditableTextTapOutsideIntent
/// in non-mobile Flutter-web, when global-hotkeys are in use, to prevent
/// them being lost after a tap outside of a text-field
class IgnoreAction extends Action<EditableTextTapOutsideIntent> {
  @override
  void invoke(EditableTextTapOutsideIntent intent) {
    debugPrint("Ignoring tap outside text-field");
  }
}
