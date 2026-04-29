import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/overview/cashpool_overview_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolOverviewScreen extends GetView<CashpoolOverviewController> {
  const CashpoolOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavbar(
      child: Obx(
        () {
          return switch (controller.state.value) {
            Loading() => const Center(child: FCircularProgress()),
            Error() => const Center(child: Text("Something went wrong :(")),
            Success() => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.cashpoolService.cashpools.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (ctx, i) {
                      final data = controller.cashpoolService.cashpools[i];
                      return FItem(
                        title: Text(data.title),
                        subtitle: Text(data.description),
                        details: Text(
                          "von ${data.owner.firstName} ${data.owner.lastName} am ${formatDate(data.createdAt)}",
                        ),
                        suffix: const Icon(FIcons.chevronRight),
                        onPress: () async {
                          await Get.toNamed(
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
                FButton(
                  onPress: () async {
                    await Get.toNamed("/cashpools/create");
                  },
                  child: const Text("Gruppenkassa erstellen"),
                ),
              ],
            ),
          };
        },
      ),
    );
  }

  String formatDate(DateTime dt) {
    // DD.MM.YY
    return "${dt.day.toString().padLeft(2, "0")}.${dt.month.toString().padLeft(2, "0")}.${dt.year.toString().replaceRange(0, 2, "")}";
  }
}
