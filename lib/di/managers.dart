part of "di.dart";

void _setupManagers() {
  Get.lazyPut<SessionManager>(
    () => SessionManager(Get.find<SharedPreferences>()),
    fenix: true,
  );
}
