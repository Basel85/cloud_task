import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  static Future<UserCredential> signIn(
      {String key="", String email="", String password=""}) async {
    switch (key) {
      case 'google':
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;
        final OAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        return await _firebaseAuth.signInWithCredential(googleAuthCredential);
      default:
        return _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
    }
  }

  static Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
