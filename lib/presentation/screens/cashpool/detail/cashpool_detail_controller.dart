import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool/cashpool_detailed.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:get/get.dart";

class CashpoolDetailController extends GetxController {
  CashpoolDetailController({required this.cashpoolService});

  late final CashpoolService cashpoolService;
  final Rx<UiState> state = UiState.loading().obs;
  final Rxn<CashpoolDetailed> cashpool = Rxn();

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchCashpoolDetails();
  }

  Future<void> fetchCashpoolDetails() async {
    state.value = UiState.loading();
    try {
      final id = (Get.arguments as Map<String, int>)["id"];
      cashpool.value = await cashpoolService.getDetailed(id!);
      state.value = UiState.success();
    } catch (e) {
      cashpool.value = null;
      state.value = UiState.error();
      rethrow;
    }
  }
}
