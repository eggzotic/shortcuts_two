import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/section.dart';

class AppState with ChangeNotifier {
  int _sectionNumber = 0;
  int get sectionNumber => _sectionNumber;
  void setSection(int section) {
    _sectionNumber = section;
    notifyListeners();
  }

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
}

class Tile3Content extends StatelessWidget {
  const Tile3Content({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return ListTile(
      leading: Text(appState.sliderValue.toStringAsFixed(0)),
      title: Slider.adaptive(
        value: appState.sliderValue,
        onChanged: appState.setSlider,
        min: 0,
        max: 100,
      ),
    );
  }
}
