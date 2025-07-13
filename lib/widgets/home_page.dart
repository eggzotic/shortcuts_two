import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../intent_actions/logging_action_dispatcher.dart';
// import '../intent_actions/say_control_back_quote_action.dart';
// import '../intent_actions/say_control_back_quote_intent.dart';
// import '../intent_actions/say_shift_action.dart';
// import '../intent_actions/say_shift_intent.dart';
import '../state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return 
    // Actions(
    //   dispatcher: LoggingActionDispatcher(),
    //   actions: {
    //     SayControlBackQuoteIntent: SayControlBackQuoteAction(),
    //     SayShiftIntent: SayShiftAction(),
    //     EditableTextTapOutsideIntent: DoNothingAction(),
    //   },
    //   child: Focus(
    //     autofocus: true,
    //     child: 
        Scaffold(
          appBar: AppBar(title: Text("Shortcuts Two")),
          body: Row(
            children: [
              NavigationRail(
                extended: true,
                destinations: appState.sections
                    .map(
                      (section) => NavigationRailDestination(
                        icon: SizedBox(child: Text("${section.number}")),
                        label: Text("Section ${section.number}"),
                      ),
                    )
                    .toList(),
                selectedIndex: appState.sectionNumber,
                onDestinationSelected: (value) => appState.setSection(value),
              ),
              VerticalDivider(),
              Expanded(child: appState.selectedSection.content),
            ],
          ),
      //   ),
      // ),
    );
  }
}
