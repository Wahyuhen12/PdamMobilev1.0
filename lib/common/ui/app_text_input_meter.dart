import 'package:flutter/material.dart';

class TextInputMeter extends StatefulWidget {
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hintText;
  final int maxLength;
  final int maxLines;

  const TextInputMeter(
      {Key key,
      this.textInputAction,
      this.keyboardType,
      this.hintText,
      this.maxLength,
      this.maxLines})
      : super(key: key);
  @override
  _TextInputMeterState createState() => _TextInputMeterState();
}

class _TextInputMeterState extends State<TextInputMeter> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      style: TextStyle(
        color: Colors.black.withOpacity(0.6),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        hintStyle: Theme.of(context).textTheme.bodyText2.merge(
              TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
        hintText: widget.hintText,
      ),
    );
  }
}
