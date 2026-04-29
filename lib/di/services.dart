part of "di.dart";

void _setupServices() {
  Get
    ..put(
      AuthService(Get.find<AuthRepo>(), Get.find<SessionManager>()),
      permanent: true,
    )
    ..put(CashpoolService(), permanent: true)
    ..put(ToastService(), permanent: true)
    ..put(DialogService(), permanent: true);
}
