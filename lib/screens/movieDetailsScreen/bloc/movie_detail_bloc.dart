import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blockflix/data/movie_detail_screen_data.dart';
import 'package:meta/meta.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailInitialEvent>(movieDetailInitialEvent);
    on<BuyButtonClickedEvent>(buyButtonClickedEvent);
    on<ViewButtonClickedEvent>(viewButtonClickedEvent);
  }

  FutureOr<void> movieDetailInitialEvent(
      MovieDetailInitialEvent event, Emitter<MovieDetailState> emit) {
    emit(MovieDetailSuccessState());
  }

  FutureOr<void> buyButtonClickedEvent(
      BuyButtonClickedEvent event, Emitter<MovieDetailState> emit) {
    movie.isBought = true;
    emit(BuyingSuccessfulState());
    emit(MovieDetailSuccessState());
  }

  FutureOr<void> viewButtonClickedEvent(
      ViewButtonClickedEvent event, Emitter<MovieDetailState> emit) {
    emit(NavigateToWatchMovie());
  }
}
