part of 'lifestyle_news_bloc.dart';

sealed class LifestyleNewsState extends Equatable {
  const LifestyleNewsState();

  @override
  List<Object> get props => [];
}

final class LifestyleNewsInitial extends LifestyleNewsState {}

final class LifestyleNewsLoading extends LifestyleNewsState {}

final class LifestyleNewsError extends LifestyleNewsState {
  final String message;

  const LifestyleNewsError(this.message);

  @override
  List<Object> get props => [message];
}

final class LifestyleNewsSuccess extends LifestyleNewsState {
  final List<News> lifestyleNewsList;

  const LifestyleNewsSuccess(this.lifestyleNewsList);

  @override
  List<Object> get props => [lifestyleNewsList];
}
