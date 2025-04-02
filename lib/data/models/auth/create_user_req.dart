class CreateUserReq {
  final String fullName;
  final String email;
  final String password;

  CreateUserReq({
    required this.fullName,
    required this.email,
    required this.password,
  });

  /// Convert to a map (useful for sending data to Supabase)
  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'email': email,
      'password': password,
    };
  }

  /// Convert from map (if you ever need to parse incoming data)
  factory CreateUserReq.fromMap(Map<String, dynamic> map) {
    return CreateUserReq(
      fullName: map['full_name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
