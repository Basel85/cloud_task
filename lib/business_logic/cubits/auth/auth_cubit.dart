import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/business_logic/cubits/auth/auth_states.dart';
import 'package:quran_app/data/data_providers/remote/firebase_helper.dart';
import 'package:quran_app/data/network/requests/firebase_requests.dart';
import 'package:quran_app/utils/app_execption_messages.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  void signInWithGoogle() {
    _signIn(key: 'google');
  }

  // void signInWithFacebook() {
  //   // _firebaseLogin = FacebookLogin();
  //   _signIn();
  // }

  // void signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     emit(AuthLoadingState());
  //     await _signIn(email: email, password: password);
  //   } on FirebaseAuthException catch (error) {
  //     emit(AuthErrorState(error.message!));
  //   } catch (_) {
  //     emit(AuthErrorState(AppExceptionMessages.unexpectedExceptionMessage));
  //   }
  // }
  Future<void> _signIn(
      {String key = "", String email = "", String password = ""}) async {
    try {
      final userCredential = await FirebaseRequests.signIn(
          key: key, email: email, password: password);
      if (userCredential.user != null) {
        emit(AuthSuccessState("Success Login ${userCredential.user!.email}"));
      } else {
        emit(AuthErrorState("Something went wrong please try again later"));
      }
    } on FirebaseAuthException catch (error) {
      emit(AuthErrorState(error.message!));
    } catch (_) {
      emit(AuthErrorState(AppExceptionMessages.unexpectedExceptionMessage));
    }
  }

  void logout() async {
    try {
      await FirebaseHelper.signOut();
      emit(AuthLogoutSuccessState("Logout Successfully"));
    } on FirebaseAuthException catch (error) {
      emit(AuthLogoutErrorState(error.message!));
    } catch (_) {
      emit(AuthLogoutErrorState(
          AppExceptionMessages.unexpectedExceptionMessage));
    }
  }
}
