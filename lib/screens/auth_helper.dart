import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static FirebaseAuth auth = FirebaseAuth.instance;

  // ✅ Get current user
  static User? getCurrentUser() {
    return auth.currentUser;
  }
}
