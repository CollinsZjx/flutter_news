import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> toastInfo({
  @required String msg,
  Color bgColor = Colors.black,
  Color textColor = Colors.orange,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIos: 1,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: duSetFontSize(16),
  );
}
