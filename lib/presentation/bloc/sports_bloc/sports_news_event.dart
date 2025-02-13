part of 'sports_news_bloc.dart';

sealed class SportsNewsEvent extends Equatable {
  const SportsNewsEvent();

  @override
  List<Object> get props => [];
}

class GetSportsNewsEvent extends SportsNewsEvent {}
