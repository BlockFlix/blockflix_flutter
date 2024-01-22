part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

abstract class SignUpActionState extends SignUpState {}

final class SignUpInitial extends SignUpState {}

class CreateAccountButtonClickedState extends SignUpActionState {}

class CreateAccountSuccessfulState extends SignUpActionState {}

class CreateAccountErrorState extends SignUpActionState {}

class NavigateToLoginScreen extends SignUpActionState {}


