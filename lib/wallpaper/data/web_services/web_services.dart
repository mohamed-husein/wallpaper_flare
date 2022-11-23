import 'package:dio/dio.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/utils/api_constants.dart';
import '../model/wallpaper_model.dart';

class WallpaperWebServices {
  Future<List<WallpaperModel>> getComputerWallpaper() async {
    final response = await Dio().get(ApiConstants.computerApiPath);
    if (response.statusCode == 200) {
      return List<WallpaperModel>.from(
        (response.data['hits'] as List).map(
          (e) => WallpaperModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }

  Future<List<WallpaperModel>> getMusicWallpaper() async {
    final response = await Dio().get(ApiConstants.musicApiPath);
    if (response.statusCode == 200) {
      return List<WallpaperModel>.from(
        (response.data['hits'] as List).map(
          (e) => WallpaperModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }

  Future<List<WallpaperModel>> search(String searchWord) async {
    final response = await Dio().get(ApiConstants.searchApiPath(searchWord));
    if (response.statusCode == 200) {
      return List<WallpaperModel>.from(
        (response.data['hits'] as List).map(
          (e) => WallpaperModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }

  Future<List<WallpaperModel>> getFoodWallpaper() async {
    final response = await Dio().get(ApiConstants.foodApiPath);
    if (response.statusCode == 200) {
      return List<WallpaperModel>.from(
        (response.data['hits'] as List).map(
          (e) => WallpaperModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }

  Future<List<WallpaperModel>> getSportsWallpaper() async {
    final response = await Dio().get(ApiConstants.sportApiPath);
    if (response.statusCode == 200) {
      return List<WallpaperModel>.from(
        (response.data['hits'] as List).map(
          (e) => WallpaperModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }
}
