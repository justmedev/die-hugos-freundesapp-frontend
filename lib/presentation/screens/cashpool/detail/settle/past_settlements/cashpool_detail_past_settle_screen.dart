import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/past_settlements/cashpool_detail_past_settle_controller.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class CashpoolDetailPastSettleScreen
    extends GetView<CashpoolDetailPastSettleController> {
  const CashpoolDetailPastSettleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: "de");
    final formatDatetime = DateFormat("d.M.y HH:mm", "de");

    return Obx(() {
      return switch (controller.state.value) {
        Loading() => const Center(child: FCircularProgress()),
        Error() => const Center(child: Text("Something went wrong :(")),
        Success() => Obx(() {
          if (controller.settlements.isEmpty) {
            return const Center(
              child: Text(
                "Bisher wurden noch keine Abrechnungen durchgeführt.",
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: controller.fetch,
              child: ListView.builder(
                itemCount: controller.settlements.length,
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, i) {
                  final settlement = controller.settlements[i];
                  return FItem(
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(settlement.from.fullName),
                        const SizedBox(width: 8),
                        const Icon(FIcons.arrowRight, size: 16),
                        const SizedBox(width: 8),
                        Text(settlement.to.fullName),
                      ],
                    ),
                    subtitle: Text(
                      "${formatDatetime.format(
                        settlement.createdAt,
                      )} · ${settlement.purpose}",
                    ),
                    details: Text(
                      formatCurrency.format(
                        settlement.amountCents / 100,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
      };
    });
  }
}
