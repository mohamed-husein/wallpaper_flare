import 'package:get_it/get_it.dart';
import '../../wallpaper/business/bloc/bloc/search_bloc.dart';
import '../../wallpaper/business/cubit/wallpaper_cubit.dart';
import '../../wallpaper/data/repository/repository.dart';
import '../../wallpaper/data/web_services/web_services.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static init() {
    sl.registerLazySingleton(() => WallpaperWebServices());

    sl.registerLazySingleton(
        () => WallpaperRepository(wallpaperWebServices: sl()));

    sl.registerFactory(() => WallpaperCubit(wallpaperRepository: sl()));
    sl.registerFactory(() => SearchBloc(wallpaperRepository: sl()));
  }
}
