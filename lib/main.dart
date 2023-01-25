import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marimina_app/splash_screen.dart';

void main() {
  runApp(const MariminaApp());
}

class MariminaApp extends StatelessWidget {
  const MariminaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return MaterialApp(
          title: 'Marimina App',
          home: SplashScreen(),
        );
      },
    );
  }
}
