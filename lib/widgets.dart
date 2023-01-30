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
    textAlign: TextAlign.center,
  );
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

Widget retreatTitle(String text) {
  return Container(
    alignment: Alignment.centerRight,
    margin: EdgeInsets.only(right: 40.w),
    child: Text(
      text,
      style: TextStyle(
          color: ConstantColors.textColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700),
      textAlign: TextAlign.right,
    ),
  );
}
Widget retreatBody(String text) {
  return Container(
    alignment: Alignment.centerRight,
    margin: EdgeInsets.symmetric(horizontal: 40.w),
    child: Text(
      text,
      style: TextStyle(
          color: ConstantColors.textColor,
          fontSize: 20.sp,
          height: 1.5,
          fontWeight: FontWeight.w400),
      textAlign: TextAlign.right,
    ),
  );
}
