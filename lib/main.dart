import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shortcuts_two/intent_actions/clear_action.dart';
import 'package:shortcuts_two/intent_actions/clear_intent.dart';
import 'intent_actions/logging_action_dispatcher.dart';
import 'intent_actions/ignore_action.dart';
import 'intent_actions/logging_shortcut_manager.dart';
import 'intent_actions/say_caps_lock_action.dart';
import 'intent_actions/say_caps_lock_intent.dart';
import 'intent_actions/say_control_back_quote_action.dart';
import 'intent_actions/say_control_back_quote_intent.dart';
import 'intent_actions/say_shift_action.dart';
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
    final appState = context.watch<AppState>();
    final isMobile = appState.isMobile;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shortcuts Two',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Shortcuts.manager(
        manager: LoggingShortcutManager(
          shortcuts: {
            LogicalKeySet(
              LogicalKeyboardKey.control,
              LogicalKeyboardKey.backquote,
            ): const SayControlBackQuoteIntent(),
            LogicalKeySet(LogicalKeyboardKey.shift): SayShiftIntent(),
            LogicalKeySet(LogicalKeyboardKey.capsLock): SayCapsLockIntent(),
            LogicalKeySet(LogicalKeyboardKey.delete): ClearIntent(),
          },
        ),
        child: Actions(
          dispatcher: LoggingActionDispatcher(),
          actions: {
            SayControlBackQuoteIntent: SayControlBackQuoteAction(),
            SayShiftIntent: SayShiftAction(appState),
            SayCapsLockIntent: SayCapsLockAction(appState),
            if (kIsWeb && !isMobile)
              EditableTextTapOutsideIntent: IgnoreAction(),
            ClearIntent: ClearAction(appState),
          },
          child: Focus(child: const HomePage(), autofocus: true),
        ),
      ),
    );
  }
}
