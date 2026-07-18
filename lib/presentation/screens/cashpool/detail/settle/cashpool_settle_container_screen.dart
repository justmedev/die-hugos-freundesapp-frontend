import "package:diehugosapp/presentation/screens/cashpool/detail/settle/settlements/cashpool_detail_settle_screen.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/widgets.dart";
import "package:forui/forui.dart";

class CashpoolSettleContainerScreen extends StatelessWidget {
  const CashpoolSettleContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavbar(
      child: FTabs(
        expands: true,
        children: const [
          .entry(
            label: Text("Ausstehend"),
            child: SizedBox.expand(child: CashpoolDetailSettleScreen()),
          ),
          .entry(label: Text("Vergangen"), child: Placeholder()),
        ],
      ),
    );
  }
}
