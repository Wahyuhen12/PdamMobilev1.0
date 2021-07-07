import 'package:flutter/material.dart';

class IconCamera extends StatefulWidget {
  final VoidCallback onPressed;
  final double size;
  final Color color;

  const IconCamera({Key key, this.onPressed, this.size, this.color})
      : super(key: key);
  @override
  _IconCameraState createState() => _IconCameraState();
}

class _IconCameraState extends State<IconCamera> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.camera_alt,
        size: widget.size,
        color: widget.color,
      ),
      onPressed: widget.onPressed,
    );
  }
}
