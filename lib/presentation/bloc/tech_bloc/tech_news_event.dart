part of 'tech_news_bloc.dart';

sealed class TechNewsEvent extends Equatable {
  const TechNewsEvent();

  @override
  List<Object> get props => [];
}

class GetTechNewsEvent extends TechNewsEvent {}
