String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira seu email';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Por favor, insira um email válido';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira sua senha';
  }
  if (value.length < 6) {
    return 'A senha deve ter pelo menos 6 caracteres';
  }
  return null;
}

String? displayNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira sua senha';
  }
  if (value.length < 4) {
    return 'A senha deve ter pelo menos 6 caracteres';
  }
  return null;
}
