part of "di.dart";

void _setupRepos() {
  Get
    ..lazyPut<AuthRepo>(
      () => AuthRepoImpl(
        prefs: Get.find<SharedPreferences>(),
        dio: Get.find<Dio>(),
      ),
      fenix: true,
    )
    ..lazyPut<CashpoolRepo>(CashpoolRepoImpl.new, fenix: true);
}
