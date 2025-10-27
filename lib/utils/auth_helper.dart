import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static Future<String?> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<String?> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
