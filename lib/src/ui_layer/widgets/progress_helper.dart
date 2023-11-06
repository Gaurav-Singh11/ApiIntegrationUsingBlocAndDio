import 'package:flutter/material.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';

class ProgressBar extends StatelessWidget {
  final double opacity;

  const ProgressBar({
    super.key,
    this.opacity = 0.6,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Color.fromRGBO(255, 255, 255, opacity),
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: AppColors.mainColor,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}
