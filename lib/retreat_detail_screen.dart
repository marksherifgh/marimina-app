import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/widgets.dart';

class RetreatDetailScreen extends StatelessWidget {
  RetreatDetailScreen({
    Key? key,
    required this.dayName,
    required this.firstRetreat,
    required this.firstTitle,
    this.secondRetreat,
    this.secondTitle,
  }) : super(key: key);
  String dayName;
  String firstRetreat;
  String firstTitle;
  String? secondTitle;
  String? secondRetreat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
      ),
      backgroundColor: ConstantColors.backgroundColor,
      body: Center(
        child: Column(
          children: [
            titleWidget(dayName),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        retreatTitle(firstTitle),
                        retreatBody(firstRetreat),
                        SizedBox(height: 30.h),
                        retreatTitle(secondTitle??''),
                        retreatBody(secondRetreat??''),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
