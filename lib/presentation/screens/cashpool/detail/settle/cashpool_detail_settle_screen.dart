import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/cashpool_detail_settle_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/widgets.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class CashpoolDetailSettleScreen
    extends GetView<CashpoolDetailSettleController> {
  const CashpoolDetailSettleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: "de");

    return ScaffoldWithNavbar(
      child: Obx(() {
        return switch (controller.state.value) {
          Loading() => const Center(child: FCircularProgress()),
          Error() => const Center(child: Text("Something went wrong :(")),
          Success() => Expanded(
            child: Obx(() {
              if (controller.settlements.isEmpty) {
                return const Center(
                  child: Text(
                    "Es gibt keine, Daten um eine Abrechnung zu erstellen!",
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.settlements.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, i) {
                    final settlement = controller.settlements[i];
                    return FItem(
                      onPress: () {},
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
                    );
                  },
                );
              }
            }),
          ),
        };
      }),
    );
  }
}
