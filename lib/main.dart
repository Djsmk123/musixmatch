// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musixmatch/core/blocs/bloc_core.dart';
import 'package:musixmatch/core/themes/theme.dart';
import 'package:musixmatch/repo/bookmark_repo/data_source/bookmark_service.dart';
import 'package:musixmatch/repo/bookmark_repo/model/bookmark_track.dart';
import 'package:musixmatch/routing/routing_dat.dart';

import 'core/utils/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvUtils.init();
  await Hive.initFlutter();
  Hive.registerAdapter(BookmarkAdapter());
  await BookMarkService.openHiveBox();
  runApp(const MyApp());
}

//....................................APP Router  ................................
final appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(380, 720),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: BlocProviders.providers,
            child: MaterialApp.router(
              title: 'Musixmatch: Read lyrics ',
              debugShowCheckedModeBanner: false,
              routerDelegate: appRouter.delegate(),
              builder: EasyLoading.init(),
              routeInformationParser: appRouter.defaultRouteParser(),
              theme: CustomTheme.themeData,
            ));
      },
    );
  }
}
//TO run Build runner
/* dart run build_runner watch --delete-conflicting-outputs*/
