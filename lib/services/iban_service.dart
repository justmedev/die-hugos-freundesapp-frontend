import "package:flutter/cupertino.dart";
import "package:get/get.dart";

class IBANService extends GetxService {
  BigInt _alphaNumericToBigInt(String v) => BigInt.parse(
    v.characters.map((c) => int.tryParse(c) ?? c.codeUnitAt(0) - 55).join(),
  );

  bool validateIBAN(String iban) {
    final normalized = iban.replaceAll(" ", "");
    if (normalized.length < 15) return false;
    final countryCode = normalized.substring(0, 2);
    final checksum = int.tryParse(normalized.substring(2, 4));
    if (checksum == null) return false;

    final rearranged = "${normalized.substring(4)}$countryCode$checksum";
    final asInt = _alphaNumericToBigInt(rearranged);

    return asInt.remainder(BigInt.from(97)).compareTo(BigInt.one) == 0;
  }
}
