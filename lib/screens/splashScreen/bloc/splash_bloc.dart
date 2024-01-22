import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>(splashInitial);
    on<GetStartedButtonClickedEvent>(getStartedButtonClickedEvent);
  }

  FutureOr<void> splashInitial(
      SplashInitialEvent event, Emitter<SplashState> emit) {
    emit(SplashInitial());
  }

  FutureOr<void> getStartedButtonClickedEvent(
      GetStartedButtonClickedEvent event, Emitter<SplashState> emit) {
    emit(SplashNaviagateToLoginState());
  }
}
