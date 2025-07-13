import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final bool isPortrait = MediaQuery.of(context).size.aspectRatio <= 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shortcuts Two"),
        actions: [if (appState.indicator != null) Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: appState.indicator!,
        )],
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: !isPortrait || !appState.isMobile,
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
    );
  }
}
