import 'package:flutter/material.dart';

class ButtonCommon extends StatelessWidget {
  final VoidCallback onPressFunctionName;
  final int bgColorOpacity;
  final int bgColorHex;
  final String buttonText;
  final int textColorHex;

  const ButtonCommon({
    Key? key,
    required this.onPressFunctionName,
    required this.bgColorOpacity,
    required this.bgColorHex,
    required this.buttonText,
    required this.textColorHex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressFunctionName(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(bgColorHex).withOpacity(bgColorOpacity / 255),
          // Set text color explicitly
          foregroundColor: Color(textColorHex),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Color(textColorHex),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
