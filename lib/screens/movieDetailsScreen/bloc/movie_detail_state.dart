part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

abstract class MovieDetailActionState extends MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoadingState extends MovieDetailState {}

class MovieDetailSuccessState extends MovieDetailState {}

class MovieDetailErrorState extends MovieDetailState {}

class BuyingState extends MovieDetailActionState {}

class BuyingSuccessfulState extends MovieDetailActionState {}

class BuyingErrorState extends MovieDetailActionState {}

class NavigateToWatchMovie extends MovieDetailActionState {}
