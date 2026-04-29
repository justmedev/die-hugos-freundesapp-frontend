import "package:flutter/widgets.dart";
import "package:forui/forui.dart";

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = FThemeBuildContext(context).theme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background,
        border: .all(
          color: theme.colors.border,
        ),
        borderRadius: const .vertical(top: .circular(8)),
      ),
      child: Padding(
        padding: const .symmetric(horizontal: 15, vertical: 8),
        child: SafeArea(child: child),
      ),
    );
  }
}
