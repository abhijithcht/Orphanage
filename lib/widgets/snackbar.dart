import 'package:flutter/material.dart';

class CSB extends SnackBar {
  CSB({
    super.key,
    required String message,
  }) : super(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black87,
          duration: const Duration(seconds: 3),
          dismissDirection: DismissDirection.horizontal,
        );

  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(CSB(message: message));
  }
}
