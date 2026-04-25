part of "di.dart";

void _setupServices() {
  Get
    ..put(AuthService(), permanent: true)
    ..put(CashpoolService(), permanent: true)
    ..put(ToastService(), permanent: true);
}
