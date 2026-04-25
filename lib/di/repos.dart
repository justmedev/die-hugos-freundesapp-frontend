part of "di.dart";

void _setupRepos() {
  Get
    ..lazyPut<AuthRepo>(AuthRepoImpl.new)
    ..lazyPut<CashpoolRepo>(CashpoolRepoImpl.new);
}
