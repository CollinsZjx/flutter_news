import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/borders.dart';
import 'package:flutter_news/common/values/colors.dart';
import 'package:flutter_news/common/values/radii.dart';

// 扁平圆角按钮
Widget btnFlatButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  double fontSize = 18,
  String title = 'button',
  String fontName = 'Montserrat',
  Color gbColor = AppColors.primaryElement,
  Color fontColor = AppColors.primaryElementText,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: gbColor,
      shape: RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
      child: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fontColor,
            fontFamily: fontName,
            fontWeight: fontWeight,
            fontSize: duSetFontSize(fontSize),
            height: 1,
          )),
    ),
  );
}

// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  @required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  String iconFileName,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: Borders.primaryBorder,
        borderRadius: Radii.k6pxRadius,
      ),
      child: Image.asset(
        'assets/images/icons-$iconFileName.png',
      ),
    ),
  );
}
