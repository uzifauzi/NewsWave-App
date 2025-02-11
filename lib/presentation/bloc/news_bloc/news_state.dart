part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object> get props => [message];
}

final class NewsSuccess extends NewsState {
  final List<News> newsList;

  const NewsSuccess(this.newsList);

  @override
  List<Object> get props => [newsList];
}
