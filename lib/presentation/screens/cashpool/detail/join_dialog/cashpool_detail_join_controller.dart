import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/services/cashpool_member_service.dart";
import "package:get/get.dart";

class CashpoolDetailJoinController extends GetxController {
  CashpoolDetailJoinController({required this.cashpoolMemberService});

  final Rxn<UiState> state = Rxn();
  final CashpoolMemberService cashpoolMemberService;

  Future<void> handleJoinPress() async {
    state.value = UiState.loading();
    final cashpoolId = (Get.arguments as Map<String, int>)["id"];
    try {
      await cashpoolMemberService.create(cashpoolId!);
      state.value = UiState.success();
      Get.back<bool>(result: true);
    } on Exception {
      state.value = UiState.error();
      // Get.back<bool>(result: false, closeOverlays: true);
    }
  }
}
