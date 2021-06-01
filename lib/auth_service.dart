import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  //signin anonymous
  Future signInAnonymous() async {
    try {
      User? user = (await _auth.signInAnonymously()).user;
      return user;
    } catch (e) {
      return null;
    }
  }

  //signin email
  Future signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //signup email
  Future signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
