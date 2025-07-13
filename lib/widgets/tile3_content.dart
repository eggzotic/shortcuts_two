import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';

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
