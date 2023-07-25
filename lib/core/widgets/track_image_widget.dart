import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;
  const TrackImageWidget(
      {super.key,
      this.width = 200,
      this.height = 200,
      this.shape = BoxShape.rectangle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: shape,
        borderRadius:
            shape != BoxShape.circle ? BorderRadius.circular(40) : null,
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://daily.jstor.org/wp-content/uploads/2023/01/good_times_with_bad_music_1050x700.jpg")),
        boxShadow: [
          if (shape != BoxShape.circle)
            BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                offset: const Offset(0, 25),
                blurRadius: 3,
                spreadRadius: -10)
        ],
      ),
    );
  }
}
