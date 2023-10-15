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
