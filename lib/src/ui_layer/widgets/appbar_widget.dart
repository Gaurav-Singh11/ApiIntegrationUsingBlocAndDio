import 'package:flutter/material.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';
import 'package:netcarrots_task/src/data_layer/res/numbers.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool shouldShowBackButton;
  final IconData? rightIcon;
  final VoidCallback? onRightIconTap;

  const AppBarWidget({
    super.key,
    required this.title,
    this.onRightIconTap,
    this.rightIcon,
    this.shouldShowBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: d_0,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.primarySwatch,
      leading: shouldShowBackButton ? IconButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
      ): null,
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: d_18,
          ),
        ),
      ),
      centerTitle: true,
      actions: <Widget>[
        if (rightIcon != null)
          IconButton(
            icon: Icon(
              rightIcon!,
              color: Colors.white,
            ),
            onPressed: onRightIconTap,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
