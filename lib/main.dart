import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/cache/cache_helper.dart';
import 'package:graduation_project/core/api/socket.dart';
import 'package:graduation_project/core/utils/app_router.dart';
import 'package:graduation_project/features/chat/presentation/view_models/chat_cubit.dart';
import 'constants.dart';
import 'core/api/dio_helper.dart';
import 'core/bloc/bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/view_models/mentor_cubit/mentor_cubit.dart';
import 'features/home/presentation/view_models/patient_cubit/patient_cubit.dart';
import 'features/medicine/presentation/view_models/medicine_cubit/medicine_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  if (CacheHelper().getData(key: userId) != null &&
      CacheHelper().getData(key: userId).isNotEmpty) {
    AppSocket.appSocket();
  }
  print(CacheHelper().getData(key: token));
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PatientCubit(getIt.get<DioHelper>())..getMentorRequests(),
        ),
        BlocProvider(
          create: (BuildContext context) => MentorCubit(getIt.get<DioHelper>()),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                MedicineCubit(getIt.get<DioHelper>())),
        BlocProvider(
            create: (BuildContext context) =>
                ChatCubit(getIt.get<DioHelper>())..getChat(back: false)),
      ],
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'IcareU',
              routerConfig: AppRouter.router,
              theme: ThemeData().copyWith(
                scaffoldBackgroundColor: Colors.white,
              ),
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
