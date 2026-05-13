enum EditType {
  name,
  iban,
  email,
  date,
}

enum UserField {
  fullName(label: "Name", type: EditType.name),
  email(label: "E-Mail", type: EditType.email),
  iban(label: "IBAN", type: EditType.iban),
  accountHolder(label: "Kontoinhaber:in", type: EditType.name),
  birthdate(label: "Geburtstag", type: EditType.date)
  ;

  const UserField({
    required this.label,
    required this.type,
  });

  final String label;
  final EditType type;
}
