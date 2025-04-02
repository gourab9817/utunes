class SigninUserReq {
  final String email;
  final String password;

  SigninUserReq({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SigninUserReq.fromMap(Map<String, dynamic> map) {
    return SigninUserReq(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
