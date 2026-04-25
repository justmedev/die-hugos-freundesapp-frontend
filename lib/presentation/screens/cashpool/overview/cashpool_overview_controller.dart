import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:get/get.dart";

class CashpoolOverviewController extends GetxController {
  CashpoolOverviewController({required this.cashpoolService});

  late final CashpoolService cashpoolService;
  final Rx<UiState> state = UiState.loading().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCashpools();
  }

  Future<void> fetchCashpools() async {
    state.value = UiState.loading();
    try {
      await cashpoolService.fetch();
      state.value = UiState.success();
    } catch (e) {
      state.value = UiState.error();
      rethrow;
    }
  }
}
