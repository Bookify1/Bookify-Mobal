import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSiginState with ChangeNotifier {
  final AuthRepository _authRepository;
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  AuthSiginState(this._authRepository);

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authRepository.signIn(email, password);
      _user = _authRepository.currentUser;
      _errorMessage = null;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}
