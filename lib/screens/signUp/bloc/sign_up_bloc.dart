import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(signUpInitialEvent);
    on<CreateAccountButtonClickedEvent>(createAccountButtonClickedEvent);
    on<LoginScreenNavigateClickedEvent>(loginScreenNavigateClickedEvent);
  }

  FutureOr<void> signUpInitialEvent(
      SignUpInitialEvent event, Emitter<SignUpState> emit) {
    emit(SignUpInitial());
  }

  FutureOr<void> createAccountButtonClickedEvent(
      CreateAccountButtonClickedEvent event, Emitter<SignUpState> emit) {
    emit(CreateAccountSuccessfulState());
  }

  FutureOr<void> loginScreenNavigateClickedEvent(
      LoginScreenNavigateClickedEvent event, Emitter<SignUpState> emit) {
    emit(NavigateToLoginScreen());
  }
}
