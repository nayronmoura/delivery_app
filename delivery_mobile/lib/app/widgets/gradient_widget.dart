import 'package:delivery_mobile/app/core/colors.dart';
import 'package:flutter/material.dart';

class GradientWidget extends StatelessWidget {
  final Widget child;
  const GradientWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            AppColors.secondary,
            AppColors.primary,
          ])),
      child: child,
    );
  }
}
