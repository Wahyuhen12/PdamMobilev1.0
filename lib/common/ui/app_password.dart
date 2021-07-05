import 'package:flutter/material.dart';

class AppPassword extends StatefulWidget {
  const AppPassword({Key key, this.text, this.passwordController}) : super(key: key);
  final String text;
  final TextEditingController passwordController;
  @override
  _AppPasswordState createState() => _AppPasswordState();
}

class _AppPasswordState extends State<AppPassword> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
        ),
        hintText: widget.text,
      ),
      controller: widget.passwordController,
    );
  }
}