import 'package:flutter/material.dart';

class TextFieldCommon extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?) validator;
  final bool enabled;
  final bool showButton;
  final Color? buttonColor; // Background color of the button
  final String? buttonIconPath;

  const TextFieldCommon({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.validator,
    this.enabled = true,
    this.showButton = false,
    this.buttonColor,
    this.buttonIconPath,
  });

  @override
  _TextFieldCommonState createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                obscureText: widget.obscureText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12, // Set the font size to 12
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(color: Color.fromARGB(55, 45, 90, 138)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: _focusNode,
                enabled: widget.enabled,
              ),
            ),
           if (widget.showButton)
              SizedBox(width: 5.0),
              Center(
                child: Container(
                  height: 48.5,
                  width: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add button click action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: widget.buttonColor ?? Colors.yellow, // Use the provided color directly
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      ">",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
