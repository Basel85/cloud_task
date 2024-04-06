abstract class AuthState {}
class AuthInitialState extends AuthState {}
class AuthLoadingState extends AuthState {}
class AuthSuccessState extends AuthState {
  final String successMessage;
  AuthSuccessState(this.successMessage);
}
class AuthErrorState extends AuthState {
  final String errorMessage;
  AuthErrorState(this.errorMessage);
}
class AuthLogoutSuccessState extends AuthState {
  final String successMessage;
  AuthLogoutSuccessState(this.successMessage);
}
class AuthLogoutErrorState extends AuthState {
  final String errorMessage;
  AuthLogoutErrorState(this.errorMessage);
}