import "dart:math" as math;

import "package:diehugosapp/presentation/screens/shuffler/shuffler_controller.dart";
import "package:diehugosapp/presentation/widgets/bottom_spacing.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:fortune_wheel/fortune_wheel.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class ShufflerScreen extends GetView<ShufflerController> {
  const ShufflerScreen({super.key});

  @override
  Widget build(BuildContext context) => Obx(() {
    if (controller.isSelectingUsers.value) {
      return ScaffoldWithNavbar(
        title: const Text("Shuffler - Teilnehmende"),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      child: FSelectTileGroup<String>(
                        control: .managed(
                          initial: controller.users.toSet(),
                          min: 2,
                          max: null,
                          onChange: (values) {
                            controller.selectedUsers
                              ..clear()
                              ..addAll(values);
                          },
                        ),
                        style: const .delta(dividerWidth: 1),
                        children: controller.users
                            .map<FSelectTile<String>>(
                              (u) => .tile(
                                title: Text(u),
                                value: u,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FTextField(
                    control: .managed(
                      initial: controller.newEntry.value,
                      onChange: (v) {
                        controller.newEntry.value = v;
                      },
                    ),
                    label: const Text("Neuer Eintrag"),
                    suffixBuilder: (ctx, style, variant) => FButton.icon(
                      onPress: () {
                        controller.handleAddEntryPressed();
                      },
                      variant: .secondary,
                      child: const Icon(FIcons.plus),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            FButton(
              onPress: () async => controller.handleShufflePressed(),
              child: const Text("Shuffle"),
            ),
            const BottomSpacing(),
          ],
        ),
      );
    }

    final theme = FThemeBuildContext(context).theme;
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.teal,
      Colors.deepPurple,
      Colors.purpleAccent,
      Colors.amber,
    ];
    return ScaffoldWithNavbar(
      title: const Text("Shuffler"),
      child: Column(
        children: [
          Text(
            controller.winner.value == ShufflerController.respinText
                ? ShufflerController.respinText
                : "${controller.winner.value ?? "???"} hat gewonnen!",
            style: theme.typography.xl.copyWith(
              color: theme.colors.foreground,
              fontWeight: .w500,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
              height: 410,
              width: 400,
              child: Transform.rotate(
                angle: -math.pi / 2,
                child: FortuneWheel(
                  edgeCollisionDetection: true,
                  onEdgeCollision: (p) async => HapticFeedback.lightImpact(),
                  key: controller.wheelKey,
                  slices: controller.selectedUsers
                      .map<Slice>(
                        (u) => Slice(
                          contents: [
                            TextContent(
                              text: u,
                              textMode: SliceTextMode.curved,
                              flipUpsideDown: false,
                              orientation: controller.selectedUsers.length > 5
                                  ? TextOrientation.vertical
                                  : TextOrientation.horizontal,
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  animationCurve: Curves.easeInOutCubicEmphasized,
                  configuration: WheelConfiguration(
                    slicePreferences: SlicePreferences(
                      backgroundColors: SliceBackgroundColors.custom(
                        colors: colors,
                      ),
                    ),
                    startPosition: WheelStartPosition.bottom,
                    circlePreferences: CirclePreferences(
                      strokeColor: theme.colors.foreground,
                      strokeWidth: 4,
                      centerIndicator: CenterIndicatorConfiguration(
                        radius: 10,
                        color: theme.colors.foreground,
                      ),
                    ),
                  ),
                  pinConfiguration: PinConfiguration.icon(
                    icon: FIcons.circleArrowLeft,
                    color: theme.colors.foreground,
                    backgroundColor: theme.colors.background,
                    position: .right,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          FButton(
            onPress: controller.winner.value == ShufflerController.respinText
                ? null
                : () async => controller.handleShufflePressed(),
            child: const Text("Noch einmal"),
          ),
          const BottomSpacing(),
        ],
      ),
    );
  });
}
