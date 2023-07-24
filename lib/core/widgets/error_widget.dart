import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/core/themes/colors.dart';
import 'package:musixmatch/core/widgets/rounded_button.dart';

class CustomErrorWidget extends StatelessWidget {
  final String msg;
  const CustomErrorWidget({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*SizedBox(
            height: 150.h,
            child: Assets.images.errorVector.image(),
          ),*/
          SizedBox(
            height: 20.h,
          ),
          Text(
            "We are sorry!",
            style: TextStyle(
                color: CustomColors.primaryColor,
                fontSize: 35.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Text(
                "Something went wrong!\nWe are trying to fix it.\n\nPlease try again later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomRoundedButton(
            width: 0.5.sw,
            backgroundColor: Colors.white,
            onTap: () {
              Navigator.pop(context);
            },
            border: Border.all(color: CustomColors.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(32.r),
            child: Text(
              "Back",
              style: TextStyle(
                  color: CustomColors.primaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
