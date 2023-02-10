import 'package:flutter/material.dart';
import '../constant/color.dart';
import '../constant/dimens.dart';

class EasyTextWidget extends StatelessWidget {
  const EasyTextWidget(
      {Key? key,
      required this.text,
      this.fontSize = kNormalFontSize,
      this.fontWeight = FontWeight.normal,
      this.color = kWhiteColor})
      : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
