import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_digitech/features/splash/screens/splash_screen.dart';
import 'package:i_digitech/utils/routes/route_generator.dart';
import 'package:i_digitech/utils/screen_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Impact Digitech',
      home: SplashScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}