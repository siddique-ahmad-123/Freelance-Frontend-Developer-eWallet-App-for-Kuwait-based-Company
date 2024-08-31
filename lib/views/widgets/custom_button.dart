import 'package:flutter/material.dart';

/// Reusable widget for creating styled buttons.
class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon; // Make icon optional by using IconData?
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Size minimumSize;
  final double? textSize; // Optional text size

  const CustomButton({
    Key? key,
    required this.text,
    this.icon, // Icon is now optional
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.minimumSize = const Size(144.93, 64),
    this.textSize, // Optional text size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, color: textColor),
            label: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize ?? 16, // Use provided textSize or default to 16
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              minimumSize: minimumSize,
            ),
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize ?? 16, // Use provided textSize or default to 16
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              minimumSize: minimumSize,
            ),
          );
  }
}
