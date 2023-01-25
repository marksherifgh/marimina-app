import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/widgets.dart';

class ProgramDetailScreen extends StatelessWidget {
  ProgramDetailScreen({
    Key? key,
    required this.dayName,
    required this.program,
  }) : super(key: key);
  String dayName;
  List program;

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
            SizedBox(height: 30.h),
            SizedBox(
              height: 680.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: ConstantColors.navbarColor,
                ),
                itemCount: program.length,
                itemBuilder: (context, index) => listChild(program[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
