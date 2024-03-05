import 'package:flutter/material.dart';
import 'package:i_digitech/utils/routes/routes.dart';
import 'package:i_digitech/utils/screen_size.dart';
import 'package:i_digitech/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the different Screen
    navigateToHomeScreen();
  }

  Future<void> navigateToHomeScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            top: ScreenSize.screenHeight * 0.8,
            child: Utils.getCircleLoader()),
        Center(
          child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: const Text('iDigitech', style: TextStyle(fontSize: 48))),
        ),
      ],
    ));
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//       (ScreenSize.screenHeight * 0.3).ph,
//       ]),