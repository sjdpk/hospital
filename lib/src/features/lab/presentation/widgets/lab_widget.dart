import 'package:flutter/material.dart';
import 'package:hospital/src/core/extensions/widget_extensions.dart';

class LabWidgets {
  static resultInfo({required String? name, required String data}) {
    return RichText(
      text: TextSpan(
        text: "$name : ",
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        children: [
          TextSpan(text: "\t $data", style: TextStyle(fontWeight: FontWeight.normal)),
        ],
      ),
    ).paddingOnly(bottom: 12);
  }
}
