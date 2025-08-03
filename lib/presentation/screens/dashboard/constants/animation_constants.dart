import 'package:flutter/material.dart';

class DashboardAnimationConstants {
  // Animation durations
  static const Duration chipSwitchDuration = Duration(milliseconds: 300);
  static const Duration chipScaleDuration = Duration(milliseconds: 200);
  static const Duration searchFocusDuration = Duration(milliseconds: 300);
  static const Duration clearButtonDuration = Duration(milliseconds: 200);

  // Animation curves
  static const Curve easeInOutCurve = Curves.easeInOut;
  static const Curve fastOutSlowInCurve = Curves.fastOutSlowIn;

  // Animation keys
  static const ValueKey<String> selectedChipKey = ValueKey('selected');
  static const ValueKey<String> unselectedChipKey = ValueKey('unselected');

  // Animation scales and offsets
  static const double defaultScale = 1.0;
  static const Offset shadowOffset = Offset(0, 2);
}
