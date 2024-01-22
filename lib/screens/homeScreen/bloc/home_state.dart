part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessfulFetched extends HomeState {}

class HomeErrorState extends HomeState {}

class NavigateToMovieScreen extends HomeActionState {}
