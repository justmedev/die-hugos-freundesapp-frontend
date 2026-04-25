import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/create/cashpool_create_screen.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/cashpool_detail_screen.dart";
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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.cashpoolService.cashpools.length,

                  itemBuilder: (ctx, i) {
                    final data = controller.cashpoolService.cashpools[i];
                    return FItem(
                      title: Text(data.title),
                      subtitle: Text(data.description),
                      details: Text(
                        "von ${data.ownerId} am ${formatDate(data.createdAt)}",
                      ),
                      suffix: const Icon(FIcons.chevronRight),
                      onPress: () async {
                        await Get.to(() => const CashpoolDetailScreen());
                      },
                    );
                  },
                ),
                const Spacer(),
                FButton(
                  onPress: () async {
                    await Get.to(CashpoolCreateScreen.new);
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
