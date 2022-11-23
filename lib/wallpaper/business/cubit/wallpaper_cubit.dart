import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import '../../data/model/wallpaper_model.dart';
import '../../data/repository/repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/utils/app_constants.dart';

part 'wallpaper_state.dart';

class WallpaperCubit extends Cubit<WallpaperState> {
  final WallpaperRepository wallpaperRepository;
  WallpaperCubit({required this.wallpaperRepository})
      : super(WallpaperInitial());

  List<WallpaperModel> _computerWallpaper = [];
  List<WallpaperModel> _sportsWallpaper = [];
  List<WallpaperModel> _musicWallpaper = [];
  List<WallpaperModel> _foodWallpaper = [];

  List<WallpaperModel> get computerWallpaper => _computerWallpaper;
  List<WallpaperModel> get sportsWallpaper => _sportsWallpaper;
  List<WallpaperModel> get musicWallpaper => _musicWallpaper;
  List<WallpaperModel> get foodWallpaper => _foodWallpaper;

  Future<void> getComputerWallpaper() async {
    final result = await wallpaperRepository.getComputerWallpaper();

    result.fold(
      (l) {
        emit(GetComputerWallpaperErrorState(_handleErrorMessage(l)));
      },
      (r) {
        _computerWallpaper = r;
        emit(GetComputerWallpaperSuccessState());
      },
    );
  }

  Future<void> getSportWallpaper() async {
    final result = await wallpaperRepository.getSportWallpaper();

    result.fold(
      (l) {
        emit(GetSportsWallpaperErrorState(_handleErrorMessage(l)));
      },
      (r) {
        _sportsWallpaper = r;

        emit(GetSportsWallpaperSuccessState());
      },
    );
  }

  Future<void> getMusicWallpaper() async {
    final result = await wallpaperRepository.getMusicWallpaper();

    result.fold(
      (l) {
        emit(GetMusicWallpaperErrorState(_handleErrorMessage(l)));
      },
      (r) {
        _musicWallpaper = r;

        emit(GetMusicWallpaperSuccessState());
      },
    );
  }

  Future<void> getFoodWallpaper() async {
    final result = await wallpaperRepository.getFoodWallpaper();

    result.fold(
      (l) {
        emit(GetFoodWallpaperErrorState(_handleErrorMessage(l)));
      },
      (r) {
        _foodWallpaper = r;

        emit(GetFoodWallpaperSuccessState());
      },
    );
  }

  List<WallpaperModel> _downloadList = [];
  List<WallpaperModel> get downloadList => _downloadList;

  manageDownLoads(String imagePath, context) async {
    // _downloadList.add(
    //   _computerWallpaper.firstWhere((element) => element.id == wallpaperId),
    // );
    // downloadList.add(
    //   _foodWallpaper.firstWhere((element) => element.id == wallpaperId),
    // );
    // downloadList.add(
    //   _musicWallpaper.firstWhere((element) => element.id == wallpaperId),
    // );
    // downloadList.add(
    //   _sportsWallpaper.firstWhere((element) => element.id == wallpaperId),
    // );

    await getStorage.write('DownloadList', _downloadList);

    final tepmDir = await getTemporaryDirectory();
    final path = '${tepmDir.path}/myfile.jpg';
    await Dio().download(imagePath, path);
    await GallerySaver.saveImage(imagePath, toDcim: true);

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('DownLoaded To Gallery')));
    emit(AddWallpaperSuccessState());
  }

  GetStorage getStorage = GetStorage();
  savedDownLoadedWallpaper() {
    List? downloadedWallpaper = getStorage.read<List>('DownloadList');
    if (downloadedWallpaper != null) {
      _downloadList =
          downloadedWallpaper.map((e) => WallpaperModel.fromJson(e)).toList();
    }
    emit(SaveDownLoadedWallpaperState());
  }

  String _handleErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppConstants.serverFailure;
      default:
        return AppConstants.unExpectedFailure;
    }
  }
}
