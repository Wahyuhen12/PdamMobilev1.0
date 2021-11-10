import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

displayBottomSheet() {
  OneContext().showBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    elevation: 5,
    builder: (context) => Container(
      width: OneContext().mediaQuery.size.width,
      height: OneContext().mediaQuery.size.height / 4,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close))
            ],
          ),
          Center(
            child: Text('Hello'),
          ),
        ],
      ),
    ),
  );
}
