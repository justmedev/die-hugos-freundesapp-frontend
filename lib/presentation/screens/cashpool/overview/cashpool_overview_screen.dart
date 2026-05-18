import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/overview/cashpool_overview_controller.dart";
import "package:diehugosapp/presentation/widgets/bottom_spacing.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class CashpoolOverviewScreen extends GetView<CashpoolOverviewController> {
  const CashpoolOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatDatetime = DateFormat("d.M.y HH:mm", "de");

    return ScaffoldWithNavbar(
      title: const Text("Gruppenkassen"),
      child: Obx(
        () => switch (controller.state.value) {
          Loading() => const Center(child: FCircularProgress()),
          Error() => const Center(child: Text("Something went wrong :(")),
          Success() => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Obx(
                  () => RefreshIndicator(
                    onRefresh: controller.fetchCashpools,
                    child: controller.cashpoolService.cashpools.isEmpty
                        ? const Text("Es gibt noch keine Gruppenkassen :(")
                        : ListView.builder(
                            itemCount:
                                controller.cashpoolService.cashpools.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (ctx, i) {
                              final data =
                                  controller.cashpoolService.cashpools[i];
                              return FItem(
                                title: Text(data.title),
                                subtitle: Text(data.description),
                                details: Text(
                                  "von ${data.owner.firstName} ${data.owner.lastName} am ${formatDatetime.format(data.createdAt)}",
                                ),
                                suffix: const Icon(FIcons.chevronRight),
                                onPress: () async {
                                  await Get.toNamed<void>(
                                    "/cashpools/details",
                                    arguments: {
                                      "id": data.id,
                                    },
                                  );
                                },
                              );
                            },
                          ),
                  ),
                ),
              ),
              FButton(
                onPress: controller.handleCreateCashpool,
                child: const Text("Gruppenkassa erstellen"),
              ),
              const BottomSpacing(),
            ],
          ),
        },
      ),
    );
  }
}
