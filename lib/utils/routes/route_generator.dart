import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_digitech/features/home/screens/home_screen.dart';
import 'package:i_digitech/features/product_detail/screens/product_detail_screen.dart';
import 'package:i_digitech/features/splash/screens/splash_screen.dart';
import 'package:i_digitech/model/products_model.dart';
import 'package:i_digitech/utils/routes/routes.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case Routes.productDetailScreen:
      final data = settings.arguments as ProductData;
        return MaterialPageRoute(builder: (context) => ProductDetailScreen(data: data));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CupertinoPageRoute(
      builder: (context) {
        return Scaffold(
            appBar: AppBar(title: const Text('ERROR')),
            body: const Center(child: Text('ERROR')));
      },
    );
  }
}
