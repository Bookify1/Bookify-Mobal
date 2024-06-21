import 'package:bookify/src/features/auth/data/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSignupState with ChangeNotifier {
  final AuthRepository _authRepository;
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  AuthSignupState(this._authRepository);

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> register(
      String email, String password, String displayName) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _authRepository.register(email, password).then((value) =>
          _authRepository.currentUser?.updateDisplayName(displayName));

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
