import "package:diehugosapp/presentation/screens/cashpool/cashpool_overview_screen.dart";
import "package:diehugosapp/presentation/screens/home/home_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => ScaffoldWithNavbar(
    child: Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [
          Text(
            "Willkommen, ${controller.authService.user?.firstName}!",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          FButton(
            onPress: () async {
              await Get.to(const CashpoolOverviewScreen());
            },
            child: const Text("Zur Gruppenkassa"),
          ),
        ],
      ),
    ),
  );
}
