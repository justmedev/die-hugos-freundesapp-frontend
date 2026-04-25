part of "di.dart";

Future<void> _setupExternals() async {
  await Get.putAsync(SharedPreferences.getInstance);
  Get.lazyPut(getNewSetupDio);
}
