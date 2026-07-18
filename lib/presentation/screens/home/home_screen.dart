import "package:diehugosapp/presentation/screens/home/home_controller.dart";
import "package:diehugosapp/presentation/widgets/bottom_spacing.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => ScaffoldWithNavbar(
    suffixes: [
      FHeaderAction(
        icon: const Icon(FIcons.user),
        onPress: () => Get.toNamed<void>("/user"),
      ),
    ],
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(
          () => Text(
            "Willkommen, ${controller.authService.user?.firstName}!",
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        const Spacer(),
        Column(
          spacing: 8,
          children: [
            FButton(
              onPress: () async {
                await Get.toNamed<void>("/shuffler");
              },
              child: const Text("Glücksrad"),
            ),
            FButton(
              onPress: () async {
                await Get.toNamed<void>("/cashpools");
              },
              child: const Text("Gruppenkassen"),
            ),
          ],
        ),
        const BottomSpacing(),
      ],
    ),
  );
}
