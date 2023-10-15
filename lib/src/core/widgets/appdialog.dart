import 'package:flutter/material.dart';
import 'package:hospital/src/core/resources/colors.dart';

import 'button.dart';

/// Show a dialog to confirm the rejection of rules.
/// This function displays an AlertDialog with a confirmation message and options to reject or accept the rules.
/// [context]: The BuildContext for showing the dialog.
/// [icon]: dialog top icon.
/// [title]: dialog title
/// btn1 : Left one
/// btn2 : RIght one
Future<void> showAppDialog(
  BuildContext context, {
  IconData? icon,
  String? title,
  String? desc,
  String? btn1Title,
  Function()? btn1OnTap,
  String? btn2Title,
  Function()? btn2OnTap,
  Widget? titleWidget,
  Widget? contentWidget,
  bool barrierDismissible = true,
}) async {
  return showDialog<void>(
    barrierDismissible: barrierDismissible,
    context: context,
    builder: (BuildContext context) {
      var lblConfirmMsg;
      return AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
        contentPadding: const EdgeInsets.all(16.0),
        title: titleWidget,
        content: contentWidget ??
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icon ?? Icons.info_outline, size: 48.0, color: primaryColor),
                const SizedBox(height: 16.0),
                Text(title ?? lblConfirmMsg, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                const SizedBox(height: 8.0),
                Text(desc ?? "", overflow: TextOverflow.visible, textAlign: TextAlign.center),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Visibility(
                      visible: btn1Title != null,
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AppButton(
                            onPressed: btn1OnTap,
                            color: secondaryColor,
                            title: btn1Title ?? "",
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: btn2Title != null,
                      child: Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AppButton(
                            onPressed: btn2OnTap,
                            title: btn2Title ?? "",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      );
    },
  );
}
