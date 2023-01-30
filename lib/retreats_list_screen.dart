import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/retreat_detail_screen.dart';
import 'package:marimina_app/widgets.dart';

import 'data/retreats.dart';

class RetreatListScreen extends StatelessWidget {
  RetreatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ConstantColors.backgroundColor,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 84.h),
            titleWidget('الخلوات'),
            SizedBox(
              height: 630.h,
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: ConstantColors.navbarColor,
                ),
                itemBuilder: (context, index) {
                  var name = retreats[index]['name'] as String;
                  var first = retreats[index]['first'] as String;
                  var firstTitle = retreats[index]['first_title'] as String;
                  var secondTitle = retreats[index]['second_title'] as String?;
                  var second = retreats[index]['second'] as String?;
                  return InkWell(
                      onTap: () =>
                          Navigator.of(context).push((MaterialPageRoute(
                              builder: (_) => RetreatDetailScreen(
                                    dayName: name,
                                    firstRetreat: first,
                                    secondRetreat: second,
                                firstTitle: firstTitle,
                                secondTitle: secondTitle,
                                  )))),
                      child: listChild(name));
                },
                itemCount: retreats.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
