import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../constants.dart';

String getLanguageCodeHelper() {
  if (kIsWeb) {
    return 'en';
  }
  final deviceLocale = Platform.localeName.split('_').first;
  for (var loc in supportedLocales) {
    if (deviceLocale == loc.languageCode) {
      return deviceLocale;
    }
  }
  return 'ar';
}

void unfocusCurrent() => FocusManager.instance.primaryFocus?.unfocus();
void showSnackBar({
  required String message,
  String? title,
  SnackBarType type = SnackBarType.info,
  double? width,
  VoidCallback? onConfirm,
  String? confirmLabel,
  VoidCallback? onCancel,
  String? cancelLabel,
}) {
  IconData? icon;
  Color? color;

  switch (type) {
    case SnackBarType.info:
      icon = Icons.info;
      color = const Color(0xFF34495E);
      break;
    case SnackBarType.success:
      icon = Icons.check_circle;
      color = Colors.green;
      break;
    case SnackBarType.error:
      icon = Icons.error;
      color = Colors.red;
      break;
  }

  width ??= kIsWeb ? 400 : width;
  final messengerState = scaffoldMessengerKey.currentState;
  if (messengerState == null) return;

  messengerState.showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: onConfirm != null ? 10 : 4),
      content: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: color, size: 24),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title ?? 'Warning',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => messengerState.hideCurrentSnackBar(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: const TextStyle(fontSize: 14, color: Color(0xFF5D6D7E)),
              ),
              if (onConfirm != null) ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed:
                          onCancel ??
                          () => messengerState.hideCurrentSnackBar(),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFFEF2F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text(
                        cancelLabel ?? 'Cancel',
                        style: const TextStyle(
                          color: Color(0xFFB91C1C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        onConfirm();
                        messengerState.hideCurrentSnackBar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD65076),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: Text(
                        confirmLabel ?? 'Confirm',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}

enum SnackBarType { info, success, error }

Future<DateTime?> selectDate({required BuildContext context}) async {
  final pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2025),
    lastDate: DateTime(2100),
  );
  if (pickedDate != null) {
    return pickedDate;
  }
  return null;
}
