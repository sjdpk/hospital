import 'package:flutter/material.dart';

extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) {
    return isVisible ? this : const SizedBox.shrink();
  }
}

extension PaddingExtension on Widget {
  Widget paddingAll(double paddingValue) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: this,
    );
  }

  Widget paddingOnly({double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }
}

/// Wraps the widget in a Flexible widget with the specified flex factor.
extension FlexibleWidgetExtension on Widget {
  Widget flexible({int flex = 1}) {
    return Flexible(
      flex: flex,
      child: this,
    );
  }
}
