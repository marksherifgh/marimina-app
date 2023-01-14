import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';

Widget titleWidget(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: ConstantFonts.titleSize,
      color: ConstantColors.textColor,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget searchWidget() {
  return Container();
}

Widget listChild(String text) {
  return Container(
    margin: EdgeInsets.only(right: 40.w, bottom: 10.h, top: 10.h),
    child: Text(
      text,
      style: TextStyle(
        color: ConstantColors.textColor,
        fontSize: ConstantFonts.listItemSize,
      ),
      textAlign: TextAlign.right,
    ),
  );
}
