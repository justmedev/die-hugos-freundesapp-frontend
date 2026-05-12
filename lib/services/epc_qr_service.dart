import "package:get/get.dart";

class EpcQrService extends GetxService {
  String generateEPCQrCodeDataV2({
    required String payeeName,
    required String iban,
    required int amountCents,
    String purpose = "",
    String currency = "EUR",
  }) =>
      """
BCD
002
1
SCT

$payeeName
$iban
$currency${amountCents / 100}


$purpose
""";
}
