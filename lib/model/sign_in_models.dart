class SignIn{
  String email;
  String password;
  String address;

  SignIn({required this.email, required this.password, required this.address});

  SignIn.fromJson(Map<String, dynamic> json)
      : email = json['email'],
       address = json['address'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    "email": email,
    'address': address,
    'password': password,
  };
}
