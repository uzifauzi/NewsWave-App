part of 'sports_news_bloc.dart';

sealed class SportsNewsState extends Equatable {
  const SportsNewsState();

  @override
  List<Object> get props => [];
}

final class SportsNewsInitial extends SportsNewsState {}

final class SportsNewsLoading extends SportsNewsState {}

final class SportsNewsError extends SportsNewsState {
  final String message;

  const SportsNewsError(this.message);

  @override
  List<Object> get props => [message];
}

final class SportsNewsSuccess extends SportsNewsState {
  final List<News> sportsNewsList;

  const SportsNewsSuccess(this.sportsNewsList);

  @override
  List<Object> get props => [sportsNewsList];
}
