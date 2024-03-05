import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Utils {
  static Widget getCircleLoader({Color color = Colors.grey}) {
    return SpinKitRing(color: color, size: 37, lineWidth: 1.7);
  }
}

extension MySizedBox on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
}
