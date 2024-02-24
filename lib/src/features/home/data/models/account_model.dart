class AccountModel {
  final String name;
  final String lastName;
  final String email;
  final String imagePath;

  AccountModel({
    this.name = 'Настроить',
    this.lastName = 'Настроить',
    this.email = 'apollon@gmail.com',
    this.imagePath = '',
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'email': email,
      'imagePath': imagePath,
    };
  }

  AccountModel copyWith(
      {String? name, String? lastName, String? email, String? imagePath}) {
    return AccountModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
