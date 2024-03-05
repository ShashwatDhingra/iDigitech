import 'package:flutter/material.dart';

PreferredSizeWidget productDetailScreenAppBar(){
  return AppBar(
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade700.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(4),
            child: Icon(Icons.home_filled),
          ),
          const SizedBox(width: 18),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade700.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(4),
            child: Icon(Icons.shopping_bag_outlined),
          ),
          const SizedBox(width: 18),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade700.withOpacity(0.7),
                borderRadius: BorderRadius.circular(4)),
            padding: EdgeInsets.all(4),
            child: Icon(Icons.share),
          ),
          const SizedBox(width: 18),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
      );
}