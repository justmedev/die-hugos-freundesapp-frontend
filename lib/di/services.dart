part of "di.dart";

void _setupServices() {
  Get
    ..put(
      AuthService(Get.find<AuthRepo>(), Get.find<SessionManager>()),
      permanent: true,
    )
    ..put(CashpoolService(Get.find<CashpoolRepo>()), permanent: true)
    ..put(
      CashpoolTransactionService(Get.find<CashpoolTransactionRepo>()),
      permanent: true,
    )
    ..put(
      CashpoolMemberService(Get.find<CashpoolMemberRepo>()),
      permanent: true,
    )
    ..put(ToastService(), permanent: true)
    ..put(DialogService(), permanent: true);
}
