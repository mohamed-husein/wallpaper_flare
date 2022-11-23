import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/utils/import_files.dart';
import '../model/wallpaper_model.dart';
import '../web_services/web_services.dart';

class WallpaperRepository {
  final WallpaperWebServices wallpaperWebServices;

  WallpaperRepository({required this.wallpaperWebServices});

  Future<Either<Failure, List<WallpaperModel>>> getComputerWallpaper() async {
    final result = await wallpaperWebServices.getComputerWallpaper();

    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<WallpaperModel>>> getSportWallpaper() async {
    final result = await wallpaperWebServices.getSportsWallpaper();

    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<WallpaperModel>>> search(
      String searchWord) async {
    final result = await wallpaperWebServices.search(searchWord);

    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<WallpaperModel>>> getFoodWallpaper() async {
    final result = await wallpaperWebServices.getFoodWallpaper();

    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<WallpaperModel>>> getMusicWallpaper() async {
    final result = await wallpaperWebServices.getMusicWallpaper();

    try {
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
