sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

final class LogInLoadingState extends AuthState {}

final class LogInSuccessState extends AuthState {}

final class LogInFailureState extends AuthState {
  final String errMessage;

  LogInFailureState({required this.errMessage});
}
