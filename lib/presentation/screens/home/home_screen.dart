import "package:diehugosapp/presentation/screens/cashpool/cashpool_overview_screen.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/cupertino.dart";
import "package:forui/forui.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_navigation/src/extension_navigation.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => ScaffoldWithNavbar(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: [
        const Text(
          "Willkommen, Mona!",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
  );
}
