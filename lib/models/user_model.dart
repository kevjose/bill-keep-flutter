class User {
  final String name;
  final String phone;
  User({
    this.name,
    this.phone,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "phone": phone,
      };
}
