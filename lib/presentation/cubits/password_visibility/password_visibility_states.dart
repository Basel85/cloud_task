abstract class PasswordVisibilityState {}

class PasswordVisibilityInitialState extends PasswordVisibilityState {}

class PasswordVisibilityChangedState extends PasswordVisibilityState {
  final bool mustBeVisible;
  PasswordVisibilityChangedState(this.mustBeVisible);
}
