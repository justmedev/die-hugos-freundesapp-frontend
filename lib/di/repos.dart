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
    ..lazyPut<CashpoolRepo>(
      () => CashpoolRepoImpl(Get.find<Dio>()),
      fenix: true,
    )
    ..lazyPut<CashpoolTransactionRepo>(
      () => CashpoolTransactionRepoImpl(Get.find<Dio>()),
      fenix: true,
    );
}
