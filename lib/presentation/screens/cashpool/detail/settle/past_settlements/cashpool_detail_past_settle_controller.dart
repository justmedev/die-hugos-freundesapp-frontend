import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_settlement.dart";
import "package:diehugosapp/services/cashpool_settlement_service.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";

class CashpoolDetailPastSettleController extends GetxController {
  CashpoolDetailPastSettleController({
    required this.cashpoolSettlementService,
  });

  late final CashpoolSettlementService cashpoolSettlementService;

  late final int cashpoolId;
  final Rx<UiState> state = UiState.loading().obs;
  final RxList<CashpoolSettlement> settlements = RxList.empty();

  @override
  Future<void> onInit() async {
    super.onInit();
    cashpoolId = (Get.arguments as Map<String, int>)["id"]!;
    await fetch();
  }

  Future<void> fetch() async {
    state.value = UiState.loading();
    try {
      final fetched = await cashpoolSettlementService.getAllByCashpoolId(
        cashpoolId,
      );
      final sorted = fetched.toList()
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      settlements.value = sorted;
      state.value = UiState.success();
    } on Exception catch (e) {
      debugPrint(e.toString());
      state.value = UiState.error();
    }
  }
}
