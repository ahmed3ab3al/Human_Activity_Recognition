import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'core/bloc/bloc_observer.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper().init();
  Bloc.observer = MyBlocObserver();
   runApp(
       const MyApp()
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark
        ));
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: ThemeData().copyWith(
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}