import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/core/themes/colors.dart';

class EmptyListWidget extends StatelessWidget {
  final String message;

  const EmptyListWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "No entry found, yet",
            style: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
