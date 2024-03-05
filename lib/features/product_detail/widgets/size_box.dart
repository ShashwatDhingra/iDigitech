import 'package:flutter/material.dart';
import 'package:i_digitech/constants/const.dart';

class SizeBoxTile extends StatelessWidget {
  SizeBoxTile({super.key, required this.size, required this.isSelected});

  String size;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: !isSelected ? 0.7 : 2),
          borderRadius: BorderRadius.circular(100)),
      child: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.transparent,
          child: Text(
            size,
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
