import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/widgets.dart';

class SongDetailScreen extends StatelessWidget {
  SongDetailScreen({
    Key? key,
    required this.songName,
    required this.songLyrics,
  }) : super(key: key);
  String songName;
  String songLyrics;

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
            SizedBox(width: 300,child: titleWidget(songName)),
            SizedBox(height: 30.h),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: 370.w,
                  child: Text(
                    songLyrics,
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
