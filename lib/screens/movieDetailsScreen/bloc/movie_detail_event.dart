part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

class MovieDetailInitialEvent extends MovieDetailEvent {}

class BuyButtonClickedEvent extends MovieDetailEvent {}

class ViewButtonClickedEvent extends MovieDetailEvent {}
