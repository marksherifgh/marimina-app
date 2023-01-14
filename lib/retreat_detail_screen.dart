import 'package:flutter/material.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/widgets.dart';

class RetreatDetailScreen extends StatelessWidget {
  RetreatDetailScreen({
    Key? key,
    required this.dayName,
    required this.firstRetreat,
    this.secondRetreat,
  }) : super(key: key);
  String dayName;
  String firstRetreat;
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
          ],
        ),
      ),
    );
  }
}
