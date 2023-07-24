import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/gen/assets.gen.dart';
import 'package:musixmatch/presentation/home_screen/widgets/trending_song_builder.dart';

import '../../../core/themes/colors.dart';

@RoutePage(name: 'TrendingView')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 25.h,
              )),
          Container(
            height: 50.h,
            width: 50.w,
            margin: EdgeInsets.symmetric(horizontal: 10.h),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: Assets.images.appLogo.provider())),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Text(
              "Trending",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const TrendingSongViewBuilder(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        currentIndex: 0,
        onTap: (value) {
          if (value == 0) {}
          if (value == 1) {
            context.router.pushNamed('/bookmarks');
          }
        },
        selectedItemColor: CustomColors.primaryColor,
        selectedLabelStyle: const TextStyle(
          color: CustomColors.primaryColor,
        ),
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmarks")
        ],
      ),
    );
  }
}
