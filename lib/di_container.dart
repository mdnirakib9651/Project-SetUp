import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project_setup/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/romote/dio/dio_client.dart';
import 'data/datasource/romote/dio/logging_interceptor.dart';
import 'helper/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async{
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.shopMaxBaseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  //---------->>> Repository <<<------------
  // sl.registerLazySingleton(() => SplashRepo(dioClient: sl(), sharedPreferences: sl()));
  // sl.registerLazySingleton(() => NewProductDioRepo(dioClient: sl()));
  // sl.registerLazySingleton(() => PopularDioRepo(dioClient: sl()));
  // sl.registerLazySingleton(() => CartRepo(dioClient: sl(), sharedPreferences: sl()));
  // sl.registerLazySingleton(() => CartPopularRepo(dioClient: sl(), sharedPreferences: sl()));
  // sl.registerLazySingleton(() => CatagoryRepo(dioClient: sl()));
  // sl.registerLazySingleton(() => LoveRepository(dioClient: sl(), sharedPreferences: sl()));
  // // --------------->>>>> Shop Max <<<<<<----------------
  // sl.registerLazySingleton(() => BrandRepo(dioClient: sl()));
  // sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  //----------->>> Provider <<<-------------
  // sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));
  // sl.registerFactory(() => NewProductDioProvider(newProductDioRepo: sl()));
  // sl.registerFactory(() => PopularDioProvider(popularDioRepo: sl()));
  // sl.registerFactory(() => CartProvider(cartRepo: sl()));
  // sl.registerFactory(() => CartPopularProvider(cartPopularRepo: sl()));
  // sl.registerFactory(() => CatagoryProvider(catagoryRepo: sl()));sl.registerFactory(() => LoveProvider(loveRepository: sl()));
  // //--------------->>>>>>> Shop Max <<<<<<<----------------
  // sl.registerFactory(() => BrandProvider(brandRepo: sl()));
  // sl.registerFactory(() => AuthProvider(authRepo: sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}