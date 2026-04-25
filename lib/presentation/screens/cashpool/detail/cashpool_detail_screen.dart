import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolDetailScreen extends StatefulWidget {
  const CashpoolDetailScreen({super.key});

  @override
  State<CashpoolDetailScreen> createState() => _CashpoolDetailScreenState();
}

class _CashpoolDetailScreenState extends State<CashpoolDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final typography = FThemeBuildContext(context).theme.typography;

    return ScaffoldWithNavbar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "23€",
                    style: TextStyle(
                      height: 1.1,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(width: 6),
                  const Text(
                    " für die Gruppe bezahlt!",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          Text(
            style: typography.xl2.copyWith(fontWeight: FontWeight.bold),
            "Aktivität",
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 10,

              itemBuilder: (ctx, i) {
                return FItem(
                  title: const Text("Ilja"),
                  subtitle: const Text("25.04.2026 15:30"),
                  details: Text(
                    "10€",
                    style: TextStyle(color: Get.theme.colorScheme.error),
                  ),
                  suffix: Icon(
                    FIcons.banknoteArrowDown,
                    color: Get.theme.colorScheme.error,
                  ),
                );
              },
            ),
          ),
          FButton(
            onPress: () {},
            child: const Text("Transaktion eintragen"),
          ),
        ],
      ),
    );
  }
}
