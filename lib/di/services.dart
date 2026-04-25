part of "di.dart";

void _setupServices() {
  Get
    ..put(AuthService.new, permanent: true)
    ..put(CashpoolService.new, permanent: true)
    ..put(ToastService.new, permanent: true);
}
