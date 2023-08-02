import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musixmatch/gen/assets.gen.dart';
import 'package:musixmatch/presentation/home_screen/widgets/trending_song_builder.dart';
import 'package:musixmatch/repo/update_repo/shorebird_update_service.dart';

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
                Icons.notification_add,
                color: Colors.white,
                size: 25.h,
              )),
          PopupMenuButton(
            color: Colors.black87,
            onSelected: (value) async {
              if (value == 0) {
                final bool isUpdateAvailable =
                    await ShoreBirdUpdateService.checkForUpdate();
                if (isUpdateAvailable) {
                  //download the update
                  await ShoreBirdUpdateService.downloadUpdate();
                }
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    value: 0,
                    child: Text(
                      "Check for updates",
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ))
              ];
            },
            child: Container(
              height: 50.h,
              width: 50.w,
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: Assets.images.appLogo.provider())),
            ),
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
