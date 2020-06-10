import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future logInWithEmail(String email, String password) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {
      AuthResult authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    return user != null;
  }
}
