import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shortcuts_two/intent_actions/ignore_action.dart';
import 'intent_actions/say_control_back_quote_action.dart';
import 'intent_actions/say_shift_action.dart';
import 'intent_actions/say_control_back_quote_intent.dart';
import 'intent_actions/say_shift_intent.dart';
import 'state/app_state.dart';
import 'widgets/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shortcuts Two',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FocusableActionDetector(
        child: const HomePage(),
        shortcuts: {
          LogicalKeySet(
            LogicalKeyboardKey.control,
            LogicalKeyboardKey.backquote,
          ): const SayControlBackQuoteIntent(),
          LogicalKeySet(LogicalKeyboardKey.shift): SayShiftIntent(),
          LogicalKeySet(LogicalKeyboardKey.capsLock): SayCapsLockIntent(),
        },
        actions: {
          SayControlBackQuoteIntent: SayControlBackQuoteAction(),
          SayShiftIntent: SayShiftAction(),
          SayCapsLockIntent: SayCapsLockAction(),
          EditableTextTapOutsideIntent: IgnoreAction(),
        },
        autofocus: true,
      ),

      // Shortcuts.manager(
      //   manager: LoggingShortcutManager(
      //     shortcuts: {
      //       LogicalKeySet(
      //         LogicalKeyboardKey.control,
      //         LogicalKeyboardKey.backquote,
      //       ): const SayControlBackQuoteIntent(),
      //       LogicalKeySet(LogicalKeyboardKey.shift): SayShiftIntent(),
      //     },
      //   ),
      //   child: const HomePage(),
      // ),
    );
  }
}

class SayCapsLockIntent extends Intent {
  const SayCapsLockIntent();
}

class SayCapsLockAction extends Action<SayCapsLockIntent> {
  @override
  Object? invoke(SayCapsLockIntent intent) {
    debugPrint("Caps-Lock pressed");
    return null;
  }
}
