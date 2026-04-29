import "package:diehugosapp/presentation/screens/cashpool/create/cashpool_create_controller.dart";
import "package:diehugosapp/presentation/widgets/scaffold_with_navbar.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolCreateScreen extends GetView<CashpoolCreateController> {
  const CashpoolCreateScreen({super.key});

  @override
  Widget build(BuildContext context) => ScaffoldWithNavbar(
    child: Obx(
      () => Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FTextFormField(
              label: const Text("Titel"),
              control: .lifted(
                value: controller.title.value,
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
              control: .lifted(
                value: controller.description.value,
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
    ),
  );
}
