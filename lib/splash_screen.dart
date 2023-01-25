import 'package:flutter/material.dart';
import 'package:marimina_app/constants.dart';
import 'package:marimina_app/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateTimer(context);
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/vectors/logo.png'),
            Text(
              'مؤتمر اسرة ماريمينا',
              style: TextStyle(
                fontSize: ConstantFonts.titleSize,
                color: ConstantColors.textColor,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }

  void navigateTimer(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => MainScreen()), (route) => false));
  }
}
