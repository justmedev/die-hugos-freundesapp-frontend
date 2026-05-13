import "package:diehugosapp/data/models/user/requests/user_update_request.dart";

class UserUpdateCmd {
  UserUpdateCmd({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.accountHolderName,
    required this.accountIBAN,
    required this.birthdate,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String? accountHolderName;
  final String? accountIBAN;
  final DateTime birthdate;

  UserUpdateRequest toRequest() => UserUpdateRequest(
    email: email,
    firstName: firstName,
    lastName: lastName,
    accountHolderName: accountHolderName,
    accountIBAN: accountIBAN,
    birthdate: birthdate,
  );
}
