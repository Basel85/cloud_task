import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/presentation/cubits/password_visibility/password_visibility_states.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityInitialState());
  static PasswordVisibilityCubit get(context) => BlocProvider.of(context);
  void togglePasswordVisibility(bool mustBeVisible) {
    emit(PasswordVisibilityChangedState(mustBeVisible));
  }
}
