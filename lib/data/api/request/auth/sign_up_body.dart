class SignUpBody {
  final String email;
  final String password;

  SignUpBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toApi() {
    return {
      'email': email,
      'password': password,
    };
  }
}
