import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/settlements/cashpool_detail_settle_controller.dart";
import "package:diehugosapp/presentation/widgets/bottom_spacing.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class CashpoolDetailSettleScreen
    extends GetView<CashpoolDetailSettleController> {
  const CashpoolDetailSettleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: "de");

    return Obx(() {
      return switch (controller.state.value) {
        Loading() => const Center(child: FCircularProgress()),
        Error() => const Center(child: Text("Something went wrong :(")),
        Success() => Obx(() {
          if (controller.settlements.isEmpty) {
            return const Center(
              child: Text(
                "Derzeit sind alle Transaktionen ausgeglichen!",
              ),
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.settlements.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, i) {
                      final settlement = controller.settlements[i];
                      return Slidable(
                        key: const ValueKey(0),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () => controller
                                .handleSettleSettlementAction(settlement),
                            confirmDismiss: () async => controller
                                .handleDismissSettlementAttempt(settlement),
                            closeOnCancel: true,
                          ),
                          children: [
                            SlidableAction(
                              onPressed: (ctx) => controller
                                  .handleSettleSettlementAction(settlement),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              backgroundColor: Colors.green,
                              foregroundColor:
                                  Get.theme.colorScheme.inverseSurface,
                              icon: FIcons.check,
                              label: "Geld ist überwiesen",
                            ),
                          ],
                        ),
                        child: FItem(
                          onPress: () => controller.handleSettlementPress(i),
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(settlement.from.fullName),
                              const SizedBox(width: 8),
                              const Icon(FIcons.arrowRight),
                              const SizedBox(width: 8),
                              Text(settlement.to.fullName),
                            ],
                          ),
                          subtitle: Text(
                            formatCurrency.format(
                              settlement.amountCents / 100,
                            ),
                          ),
                          details: const Icon(FIcons.chevronRight),
                        ),
                      );
                    },
                  ),
                ),
                FButton(
                  onPress: () {},
                  child: const Text("Überweisung eintragen"),
                ),
                const BottomSpacing(),
              ],
            );
          }
        }),
      };
    });
  }
}
