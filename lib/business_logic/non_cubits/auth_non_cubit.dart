import 'package:firebase_auth/firebase_auth.dart';
import 'package:quran_app/data/network/requests/firebase_requests.dart';

class AuthNonCubit {
  static Stream<User?> authStateChanges() {
    return FirebaseRequests.authStateChanges();
  }
}
