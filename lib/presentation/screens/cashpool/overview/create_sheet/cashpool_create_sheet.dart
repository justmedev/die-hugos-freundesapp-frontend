import "package:diehugosapp/presentation/screens/cashpool/overview/create_sheet/cashpool_create_controller.dart";
import "package:diehugosapp/presentation/styles.dart";
import "package:diehugosapp/presentation/widgets/bottom_sheet_container.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolCreateSheet extends GetView<CashpoolCreateController> {
  const CashpoolCreateSheet({super.key});

  @override
  Widget build(BuildContext context) => BottomSheetContainer(
    child: Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            "Gruppenkassa erstellen",
            style: Styles.titleStyle,
          ),
          FTextFormField(
            label: const Text("Titel"),
            hint: "Kroatien 2026",
            control: .managed(
              onChange: (v) => controller.title.value = v,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => ((value?.length ?? 0) >= 1)
                ? null
                : "Der eingegebene Titel ist zu kurz.",
          ),
          const SizedBox(height: 10),
          FTextFormField.multiline(
            label: const Text("Beschreibung"),
            hint: "Absoluter Abriss",
            control: .managed(
              onChange: (v) => controller.description.value = v,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => ((value?.length ?? 0) >= 1)
                ? null
                : "Die eingegebene Beschreibung ist zu kurz.",
          ),
          const SizedBox(height: 20),
          FButton(
            child: const Text("Erstellen"),
            onPress: () => controller.handleCreatePressed(),
          ),
        ],
      ),
    ),
  );
}
