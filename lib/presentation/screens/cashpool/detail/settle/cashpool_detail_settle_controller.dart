import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool_settlement/cashpool_settlement.dart";
import "package:diehugosapp/services/cashpool_settlement_service.dart";
import "package:flutter/foundation.dart";
import "package:get/get.dart";

class CashpoolDetailSettleController extends GetxController {
  CashpoolDetailSettleController({required this.cashpoolSettlementService});

  late final CashpoolSettlementService cashpoolSettlementService;

  final Rx<UiState> state = UiState.loading().obs;
  final RxList<CashpoolSettlement> settlements = RxList.empty();

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetch();
  }

  Future<void> fetch() async {
    state.value = UiState.loading();
    try {
      final cashpoolId = (Get.arguments as Map<String, int>)["id"];
      settlements.value =
          (await cashpoolSettlementService.getSettlementsByCashpoolId(
            cashpoolId!,
          )).toList();
      state.value = UiState.success();
    } on Exception catch (e) {
      debugPrint(e.toString());
      state.value = UiState.error();
    }
  }
}
