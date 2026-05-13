import "package:diehugosapp/presentation/screens/user/user_controller.dart";
import "package:diehugosapp/presentation/widgets/bottom_spacing.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";
import "package:intl/intl.dart";

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatDatetime = DateFormat("dd.MM.y HH:mm", "de");
    final formatDate = DateFormat("dd.MM.y", "de");

    return ScaffoldWithNavbar(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Column(
              spacing: 8,
              children: [
                FTile(
                  prefix: const Icon(FIcons.userRound),
                  title: Text("${controller.authService.user?.fullName}"),
                  subtitle: const Text("Name"),
                  suffix: const Icon(FIcons.pen),
                ),
                FTile(
                  prefix: const Icon(FIcons.mail),
                  title: Text(controller.authService.user?.email ?? "?"),
                  subtitle: const Text("E-Mail"),
                  suffix: const Icon(FIcons.pen),
                ),
                FTile(
                  prefix: const Icon(FIcons.creditCard),
                  title: Text(
                    controller.authService.user?.accountIBAN ??
                        "Keine IBAN hinterlegt",
                  ),
                  subtitle: const Text("IBAN"),
                  suffix: const Icon(FIcons.pen),
                ),
                FTile(
                  prefix: const Icon(FIcons.landmark),
                  title: Text(
                    controller.authService.user?.accountIBAN ??
                        "Kein:e Kontoinhaber:in hinterlegt",
                  ),
                  subtitle: const Text("Kontoinhaber:in"),
                  suffix: const Icon(FIcons.pen),
                ),
                FTile(
                  prefix: const Icon(FIcons.landmark),
                  title: Text(
                    formatDate.format(
                      controller.authService.user!.birthdate,
                    ),
                  ),
                  subtitle: const Text("Geburtstag"),
                  suffix: const Icon(FIcons.pen),
                ),
                Text(
                  "Erstellt am ${formatDatetime.format(controller.authService.user!.createdAt)}",
                ),
              ],
            ),
          ),
          const Spacer(),
          FButton(
            variant: FButtonVariant.destructive,
            onPress: () => controller.logout(),
            child: const Text("Logout"),
          ),
          const BottomSpacing(),
        ],
      ),
    );
  }
}
