part of 'tech_news_bloc.dart';

sealed class TechNewsState extends Equatable {
  const TechNewsState();

  @override
  List<Object> get props => [];
}

final class TechNewsInitial extends TechNewsState {}

final class TechNewsLoading extends TechNewsState {}

final class TechNewsError extends TechNewsState {
  final String message;

  const TechNewsError(this.message);

  @override
  List<Object> get props => [message];
}

final class TechNewsSuccess extends TechNewsState {
  final List<News> techNewsList;

  const TechNewsSuccess(this.techNewsList);

  @override
  List<Object> get props => [techNewsList];
}
