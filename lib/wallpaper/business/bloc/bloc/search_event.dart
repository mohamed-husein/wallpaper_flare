part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchNewsEvent extends SearchEvent {
  final String query;

  const GetSearchNewsEvent(this.query);

  @override
  List<Object> get props => [query];
}
