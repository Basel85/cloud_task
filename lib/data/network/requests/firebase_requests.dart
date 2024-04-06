import 'package:firebase_auth/firebase_auth.dart';
import 'package:quran_app/data/data_providers/remote/firebase_helper.dart';

class FirebaseRequests {
  static Future<UserCredential> signIn({String key = "", String email = "", String password = ""}) {
    return FirebaseHelper.signIn(key: key,email: email,password: password);
  }
  static Future<void> signOut() {
    return FirebaseHelper.signOut();
  }
  static Stream<User?> authStateChanges() {
    return FirebaseHelper.authStateChanges();
  }

}

// class FacebookLogin extends FirebaseLogin {
//   @override
//   Future<UserCredential> signIn() async {
//     // Trigger the sign-in flow
//     final LoginResult loginResult = await FacebookAuth.instance.login();
//
//     // Create a credential from the access token
//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance
//         .signInWithCredential(facebookAuthCredential);
//   }
// }
