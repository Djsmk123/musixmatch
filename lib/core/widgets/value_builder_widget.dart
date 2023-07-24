import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ValueBuilderWidget extends StatelessWidget {
  final String title;
  final String value;
  const ValueBuilderWidget(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title : ",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
