part of 'wallpaper_cubit.dart';

abstract class WallpaperState {
  const WallpaperState();
}

class WallpaperInitial extends WallpaperState {}

class GetComputerWallpaperSuccessState extends WallpaperState {}



class AddWallpaperSuccessState extends WallpaperState {}



class GetComputerWallpaperErrorState extends WallpaperState {
  final String error;

  const GetComputerWallpaperErrorState(this.error);
}

class GetSportsWallpaperSuccessState extends WallpaperState {}
class SaveDownLoadedWallpaperState extends WallpaperState {}

class GetSportsWallpaperErrorState extends WallpaperState {
  final String error;

  const GetSportsWallpaperErrorState(this.error);
}

class GetFoodWallpaperSuccessState extends WallpaperState {}

class GetFoodWallpaperErrorState extends WallpaperState {
  final String error;

  const GetFoodWallpaperErrorState(this.error);
}

class GetMusicWallpaperSuccessState extends WallpaperState {}

class GetMusicWallpaperErrorState extends WallpaperState {
  final String error;

  const GetMusicWallpaperErrorState(this.error);
}
