part of "di.dart";

void _setupServices() {
  Get
    ..lazyPut(AuthService.new)
    ..lazyPut(CashpoolService.new)
    ..lazyPut(ToastService.new);
}
