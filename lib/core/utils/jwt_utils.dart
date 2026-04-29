import "dart:convert";

DateTime? getJWTExpirationDate(String token) {
  try {
    final parts = token.split(".");
    if (parts.length != 3) return null;

    // Decode the payload (index 1)
    // We use base64.normalize to ensure the string length is a multiple of 4
    final payload = parts[1];
    final normalized = base64.normalize(payload);
    final resp = utf8.decode(base64.decode(normalized));

    final payloadMap = json.decode(resp) as Map<String, dynamic>;

    if (payloadMap.containsKey("exp")) {
      // The 'exp' claim is in seconds since epoch
      return DateTime.fromMillisecondsSinceEpoch(
        (payloadMap["exp"] as int) * 1000,
        isUtc: true,
      );
    }
  } on Exception {
    return null;
  }
  return null;
}
