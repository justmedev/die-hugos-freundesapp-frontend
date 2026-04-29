import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/overview/create_sheet/cashpool_create_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/overview/create_sheet/cashpool_create_sheet.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:flutter/widgets.dart";
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
      await cashpoolService.getAll();
      state.value = UiState.success();
    } catch (e) {
      state.value = UiState.error();
      rethrow;
    }
  }

  Future<void> handleCreateCashpool() async {
    Get.lazyPut(
      () => CashpoolCreateController(
        cashpoolService: Get.find<CashpoolService>(),
      ),
    );
    await Get.bottomSheet<void>(
      const CashpoolCreateSheet(),
      settings: RouteSettings(arguments: Get.arguments),
      backgroundColor: Get.theme.colorScheme.surface,
      isScrollControlled: true,
    );
  }
}
