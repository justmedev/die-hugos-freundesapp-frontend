import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/cashpool_detail_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class CashpoolDetailScreen extends GetView<CashpoolDetailController> {
  const CashpoolDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = FThemeBuildContext(context).theme.typography;
    final formatCurrency = NumberFormat.simpleCurrency(locale: "de");
    final formatDatetime = DateFormat("d.M.y HH:mm", "de");

    return ScaffoldWithNavbar(
      child: Obx(() {
        return switch (controller.state.value) {
          Loading() => const Center(child: FCircularProgress()),
          Error() => const Center(child: Text("Something went wrong :(")),
          Success() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "23€",
                        style: TextStyle(
                          height: 1.1,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(width: 6),
                      const Text(
                        " für die Gruppe bezahlt!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              Text(
                style: typography.xl2.copyWith(fontWeight: FontWeight.bold),
                "Aktivität",
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: controller.transactions.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, i) {
                    final transaction = controller.transactions[i];
                    return FItem(
                      title: Text(transaction.label),
                      subtitle: Text(
                        formatDatetime.format(transaction.createdAt),
                      ),
                      details: Text(
                        formatCurrency.format(transaction.amountCents / 100),
                        style: TextStyle(
                          color: transaction.amountCents > 0
                              ? Colors.green
                              : Get.theme.colorScheme.error,
                        ),
                      ),
                      suffix: Icon(
                        FIcons.banknoteArrowDown,
                        color: transaction.amountCents > 0
                            ? Colors.green
                            : Get.theme.colorScheme.error,
                      ),
                    );
                  },
                ),
              ),
              FButton(
                onPress: controller.showCreateTransactionSheet,
                child: const Text("Transaktion eintragen"),
              ),
            ],
          ),
        };
      }),
    );
  }
}
