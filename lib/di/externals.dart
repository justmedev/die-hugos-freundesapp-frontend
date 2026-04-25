part of "di.dart";

Future<void> _setupExternals() async {
  await Get.putAsync(SharedPreferences.getInstance, permanent: true);
  Get.put(getNewSetupDio(), permanent: true);
}
