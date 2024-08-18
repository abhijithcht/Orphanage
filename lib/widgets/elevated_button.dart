import 'package:flutter/material.dart';

class ELB extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color background;
  final Color foreground;

  const ELB({
    super.key,
    required this.text,
    required this.onPressed,
    this.background = Colors.blue,
    this.foreground = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: foreground,
                backgroundColor: background,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
