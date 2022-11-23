import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/wallpaper_model.dart';
import '../../../data/repository/repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/app_constants.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WallpaperRepository wallpaperRepository;
  SearchBloc({required this.wallpaperRepository}) : super(SearchInitial()) {
    on<GetSearchNewsEvent>(_getSearchNews);
  }

  FutureOr<void> _getSearchNews(
      GetSearchNewsEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    final results = await wallpaperRepository.search(event.query);

    results.fold(
      (l) => emit(
        SearchError(_mapFailureToString(l)),
      ),
      (r) => emit(
        SearchLoaded(
          wallpaper: r,
        ),
      ),
    );
  }

  String _mapFailureToString(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppConstants.serverFailure;
      default:
        return AppConstants.unExpectedFailure;
    }
  }
}
