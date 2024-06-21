import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  static final idUser = FirebaseAuth.instance.currentUser?.uid;
  static final nameUser = FirebaseAuth.instance.currentUser?.displayName;

  AuthRepository(this._firebaseAuth);

  Future<void> register(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    if (_firebaseAuth.currentUser != null) {
      await _firebaseAuth.currentUser!.delete();
    }
  }
}
