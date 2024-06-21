import 'package:bookify/src/features/auth/data/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<void> execute(String email, String password) {
    return authRepository.register(email, password);
  }
}
