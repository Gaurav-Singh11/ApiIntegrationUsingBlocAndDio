import 'package:flutter/material.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';
import 'package:netcarrots_task/src/data_layer/res/numbers.dart';
import 'package:netcarrots_task/src/data_layer/res/styles.dart';

class CommonAppButton extends StatelessWidget {
  const CommonAppButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: d_50,
      margin: AppStyles.pd8,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(d_0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(d_15),
            ),
          ),

          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.mainColor),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.whiteLightBold20,
          ),
        ),
      ),
    );
  }
}
