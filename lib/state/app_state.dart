import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shortcuts_two/widgets/tile3_content.dart';
import '../model/section.dart';

class AppState with ChangeNotifier {
  int _sectionNumber = 0;
  int get sectionNumber => _sectionNumber;
  void setSection(int section) {
    _sectionNumber = section;
    notifyListeners();
  }

  bool get isMobile => [
    TargetPlatform.android,
    TargetPlatform.fuchsia,
    TargetPlatform.iOS,
  ].contains(defaultTargetPlatform);

  late final sections = [
    Section(),
    Section(),
    Section(
      title: "Custom Section",
      content: Column(
        children: [
          ListTile(
            key: ValueKey("Tile 1"),
            title: TextFormField(initialValue: "Custom text 1"),
          ),
          ListTile(
            key: ValueKey("Tile 2"),
            title: TextFormField(initialValue: "Custom text 2"),
          ),
          ListTile(
            key: ValueKey("Tile 3"),
            title: Text("Not a text-field"),
            leading: IconButton(
              icon: Icon(Icons.abc),
              onPressed: () {
                debugPrint("Tapped button in Tile 3");
              },
            ),
          ),
          Tile3Content(),
        ],
      ),
    ),
  ];

  Section get selectedSection => sections[_sectionNumber];

  double _sliderValue = 0;
  double get sliderValue => _sliderValue;
  void setSlider(double value) {
    _sliderValue = value;
    notifyListeners();
  }

  Widget? _indicator;
  Widget? get indicator => _indicator;
  void setIndicator(Widget? indicator) {
    _indicator = indicator;
    notifyListeners();
  }
}
