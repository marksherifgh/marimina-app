import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/widgets.dart';

class SongDetailScreen extends StatelessWidget {
  SongDetailScreen({
    Key? key,
    required this.songName,
    required this.songText,
  }) : super(key: key);
  String songName;
  String songText;

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
            titleWidget(songName),
            SizedBox(height: 30.h),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: 360.w,
                  child: Text(
                    songText,
                    style: TextStyle(
                        color: ConstantColors.textColor,
                        fontSize: ConstantFonts.listItemSize,height: 2.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
