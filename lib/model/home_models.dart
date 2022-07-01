class Home {
  String email;
  String password;

  Home({required this.email, required this.password});

  Home.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        "email": email,
        'password': password,
      };
}
