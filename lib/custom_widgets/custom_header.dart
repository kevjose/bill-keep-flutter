import 'package:bill_keep/custom_widgets/header_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String lineOneText;
  final String lineTwotext;
  final Color fgColor;
  final Color bgColor;
  final Color color;

  CustomHeader({
    this.lineOneText,
    this.lineTwotext,
    this.color,
    this.fgColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                lineOneText,
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = fgColor,
                ),
              ),
              // Solid text as fill.
              Text(
                lineOneText,
                style: TextStyle(
                    fontSize: 44, color: bgColor, fontWeight: FontWeight.w800),
              ),
            ],
          ),
          HeaderText(
            text: lineTwotext,
            alignment: Alignment.centerLeft,
            size: 44,
            color: color,
          )
        ],
      ),
    );
  }
}
