import 'package:flutter/material.dart';

class ButtonCommon extends StatelessWidget {
  final VoidCallback onPressFunctionName;
  final int bgColorOpacity;
  final int bgColorHex;
  final String buttonText;
  final int textColorHex;
  final String? iconPath;
  final BorderSide? buttonBorder; // Optional border for the button

  const ButtonCommon({
    Key? key,
    required this.onPressFunctionName,
    required this.bgColorOpacity,
    required this.bgColorHex,
    required this.buttonText,
    required this.textColorHex,
    this.iconPath,
    this.buttonBorder, // Make the buttonBorder parameter optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressFunctionName(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(bgColorHex).withOpacity(bgColorOpacity / 255),
          onPrimary: Color(textColorHex),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
            side: buttonBorder ?? BorderSide.none, // Use buttonBorder if provided, otherwise BorderSide.none
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Check if iconPath is provided and not null
            if (iconPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Image.asset(
                  iconPath!,
                  height: 12, // Adjust the height as needed
                  width: 12, // Adjust the width as needed
                ),
              ),
            // Text
            Text(
              buttonText,
              style: TextStyle(
                color: Color(textColorHex),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
