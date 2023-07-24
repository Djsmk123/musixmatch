import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/core/themes/colors.dart';

class CustomRoundedButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final bool isEnable;
  final Color? backgroundColor;
  final Function()? onTap;

  final Border? border;
  final BorderRadius? borderRadius;
  const CustomRoundedButton(
      {super.key,
      required this.child,
      this.onTap,
      this.width = 120,
      this.height = 50,
      this.isEnable = true,
      this.backgroundColor = CustomColors.primaryColor,
      this.border,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: isEnable ? onTap : null, child: Center(child: container()));
  }

  container() => Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          color: isEnable ? backgroundColor : Colors.grey.shade500,
          border: border,
        ),
        child: Center(
          child: child,
        ),
      );
}
