import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_colors.dart';

class AppButton extends StatefulWidget {
  const AppButton({Key key, this.text, this.color, this.ontap}) : super(key: key);
  final VoidCallback ontap;
  final String text;
  final Color color;
  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 42.0,
        width: 95.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: widget.color),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right :10.0),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.text,
                style: TextStyle(fontFamily: "Sofia", color: Colors.white, ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
