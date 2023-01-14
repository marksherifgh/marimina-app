import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/program_detail_screen.dart';
import 'package:marimina_app/widgets.dart';

class ProgramListScreen extends StatelessWidget {
  ProgramListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantColors.backgroundColor,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 84.h),
            titleWidget('برنامج اليوم'),
            SizedBox(
              height: 630.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: ConstantColors.navbarColor,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () => Navigator.of(context).push(
                          (MaterialPageRoute(
                              builder: (_) => ProgramDetailScreen(dayName: 'اليوم الاول',)))),
                      child: listChild('اليوم الاول'));
                },
                itemCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
