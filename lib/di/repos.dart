part of "di.dart";

void _setupRepos() {
  Get
    ..lazyPut<AuthRepo>(
      () => AuthRepoImpl(
        sessionManager: Get.find<SessionManager>(),
        dio: Get.find<Dio>(),
      ),
      fenix: true,
    )
    ..lazyPut<CashpoolRepo>(CashpoolRepoImpl.new, fenix: true);
}
