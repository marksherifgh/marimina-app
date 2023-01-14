import 'package:flutter/material.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/widgets.dart';

class ProgramDetailScreen extends StatelessWidget {
  ProgramDetailScreen({
    Key? key,
    required this.dayName,
    required this.firstPeriod,
  }) : super(key: key);
  String dayName;
  String firstPeriod;

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
          ],
        ),
      ),
    );
  }
}
