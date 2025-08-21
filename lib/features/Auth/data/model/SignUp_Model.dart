class SignUpReq {
  final String email;
  final String password;

  SignUpReq({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{"email": email, "password": password};
  }
}
