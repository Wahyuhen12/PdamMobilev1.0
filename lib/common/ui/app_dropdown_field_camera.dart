import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_icon_camera.dart';

class DropdownField extends StatefulWidget {
  final dynamic value;
  final Function(dynamic) onChanged;
  final List<DropdownMenuItem<dynamic>> items;
  final VoidCallback onPressed;

  const DropdownField(
      {Key key, this.value, this.onChanged, this.items, this.onPressed})
      : super(key: key);
  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: DropdownButtonFormField<dynamic>(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black.withOpacity(0.3),
              )),
            ),
            value: widget.value,
            items: widget.items,
            onChanged: widget.onChanged,
          ),
        ),
        IconCamera(
          size: 30,
          color: Colors.black,
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}
