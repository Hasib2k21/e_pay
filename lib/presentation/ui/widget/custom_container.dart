import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double height;

  const CustomContainer({super.key,
    required this.child,
   required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color(0xFF3BA0E3), // Lighter blue
            Color(0xFF1077BB),],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),

      ),
      child: child,
    );
  }
}
