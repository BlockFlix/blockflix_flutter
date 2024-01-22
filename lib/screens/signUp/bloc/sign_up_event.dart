part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {}

class CreateAccountButtonClickedEvent extends SignUpEvent {}

class LoginScreenNavigateClickedEvent extends SignUpEvent {}
