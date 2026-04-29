import "package:diehugosapp/data/models/cashpool/requests/cashpool_create_request.dart";

class CashpoolCreateCmd {
  const CashpoolCreateCmd({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  CashpoolCreateRequest toRequest() => CashpoolCreateRequest(
    title: title,
    description: description,
  );
}
