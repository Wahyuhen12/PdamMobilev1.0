import 'package:flutter/material.dart';

class AppText extends StatefulWidget {
  const AppText({Key key,this.text, this.texteditingController}) : super(key: key);
  final String text;
  final TextEditingController texteditingController;
  @override
  _AppTextState createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.text
      ),
      controller: widget.texteditingController,
    );
  }
}
