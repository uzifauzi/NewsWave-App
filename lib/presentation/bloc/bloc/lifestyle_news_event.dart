part of 'lifestyle_news_bloc.dart';

sealed class LifestyleNewsEvent extends Equatable {
  const LifestyleNewsEvent();

  @override
  List<Object> get props => [];
}

class GetLifestyleNewsEvent extends LifestyleNewsEvent {}
