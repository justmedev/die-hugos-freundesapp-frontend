class User {
  final int id;
  final DateTime updatedAt;
  final DateTime createdAt;

  final String email;
  final String firstName;
  final String lastName;
  final DateTime birthdate;

  final bool isAdmin;

  User(
    this.id,
    this.updatedAt,
    this.createdAt,
    this.email,
    this.firstName,
    this.lastName,
    this.birthdate,
    this.isAdmin,
  );

  User.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int,
      updatedAt = DateTime.parse(json['updated_at'] as String),
      createdAt = DateTime.parse(json['created_at'] as String),
      email = json['email'] as String,
      firstName = json['first_name'] as String,
      lastName = json['last_name'] as String,
      birthdate = DateTime.parse(json['birthdate'] as String),
      isAdmin = json['is_admin'] as bool;

  Map<String, dynamic> toJson() => {
    'id': id,
    'updated_at': updatedAt,
    'created_at': createdAt,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'birthdate': birthdate,
    'is_admin': isAdmin,
  };
}
