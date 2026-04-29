import "package:diehugosapp/core/errors/not_a_cashpool_member.dart";
import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/data/models/cashpool/cashpool_detailed.dart";
import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/create_transaction_sheet/cashpool_create_transaction_controller.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/create_transaction_sheet/cashpool_create_transaction_sheet.dart";
import "package:diehugosapp/services/cashpool_service.dart";
import "package:diehugosapp/services/cashpool_transaction_service.dart";
import "package:diehugosapp/services/dialog_service.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolDetailController extends GetxController {
  CashpoolDetailController({
    required this.cashpoolService,
    required this.cashpoolTransactionService,
    required this.dialogService,
  });

  late final CashpoolService cashpoolService;
  late final CashpoolTransactionService cashpoolTransactionService;
  late final DialogService dialogService;

  final Rx<UiState> state = UiState.loading().obs;
  final Rxn<CashpoolDetailed> cashpool = Rxn();
  final RxList<CashpoolTransaction> transactions = RxList.empty();
  final RxInt totalCashpoolValueCents = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    transactions.stream.listen((data) {
      if (transactions.isEmpty) return;
      totalCashpoolValueCents.value = transactions
          .map((t) => t.amountCents)
          .reduce((a, b) => a + b);
    });

    await fetchCashpoolDetails();
  }

  Future<void> fetchCashpoolDetails() async {
    state.value = UiState.loading();
    try {
      final id = (Get.arguments as Map<String, int>)["id"];

      cashpool.value = await cashpoolService.getDetailed(id!);
      state.value = UiState.success();

      await fetchCashpoolTransactions();
    } on NotACashpoolMember {
      await dialogService.show(
        dismissable: false,
        builder: (context, style, animation) => FDialog(
          style: style,
          animation: animation,
          title: const Text("Kein Mitglied"),
          body: const Text(
            "Du bist noch nicht Mitglied dieser Gruppenkassa. Wenn du beitrittst, musst du auch an den Zahlungen teilnehmen. Willst du beitreten?",
          ),
          actions: [
            FButton(
              variant: .outline,
              onPress: () => Get.close(2),
              child: const Text("Zurück zur Übersicht"),
            ),
            FButton(
              onPress: () {
                // TODO: Join
                Get.back(); // Close dialog
              },
              child: const Text("Beitreten"),
            ),
          ],
        ),
      );
    } catch (e) {
      cashpool.value = null;
      state.value = UiState.error();
      rethrow;
    }
  }

  Future<void> fetchCashpoolTransactions() async {
    if (cashpool.value == null) {
      debugPrint("A cashpool has to be loaded first!");
      state.value = UiState.error(
        "A cashpool has to be loaded before loading transactions",
      );
      return;
    }
    state.value = UiState.loading();

    try {
      transactions
        ..clear()
        ..addAll(
          await cashpoolTransactionService.getByCashpool(cashpool.value!.id),
        );
    } on Exception catch (e) {
      print(e);
      state.value = UiState.error("Unable to fetch transactions");
    }
    state.value = UiState.success();
  }

  Future<void> showCreateTransactionSheet() async {
    Get.lazyPut(
      () => CashpoolCreateTransactionController(
        cashpoolTransactionService: cashpoolTransactionService,
      ),
    );

    final transaction = await Get.bottomSheet<CashpoolTransaction>(
      const CashpoolCreateTransactionSheet(),
      settings: RouteSettings(arguments: Get.arguments),
      backgroundColor: Get.theme.colorScheme.surface,
      isScrollControlled: true,
    );
    if (transaction != null) transactions.insert(0, transaction);
  }
}
