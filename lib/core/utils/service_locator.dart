import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../api/dio_helper.dart';

final getIt = GetIt.instance;
void setupServiceLocator(){
  getIt.registerSingleton<DioHelper>(
      DioHelper(dio: Dio())
  );
}