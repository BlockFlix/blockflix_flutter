part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

abstract class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

class LoginSubmitState extends LoginActionState {}

class LoginErrorState extends LoginActionState {}

class LoginSuccessfulState extends LoginActionState {}

class NavigateToSignUpScreen extends LoginActionState {}
