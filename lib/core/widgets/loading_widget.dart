import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/core/themes/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String message;
  const LoadingWidget({super.key, this.message = "Please wait..."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: CustomColors.primaryColor,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}
