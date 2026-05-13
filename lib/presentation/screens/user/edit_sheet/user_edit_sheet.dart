import "package:diehugosapp/presentation/screens/user/edit_sheet/user_edit_controller.dart";
import "package:diehugosapp/presentation/screens/user/user_field.dart";
import "package:diehugosapp/presentation/styles.dart";
import "package:diehugosapp/presentation/widgets/bottom_sheet_container.dart";
import "package:diehugosapp/presentation/widgets/bottom_spacing.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class UserEditSheet extends GetView<UserEditController> {
  const UserEditSheet({super.key});

  @override
  Widget build(BuildContext context) => BottomSheetContainer(
    child: Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          Text(
            "Feld bearbeiten",
            style: Styles.titleStyle,
          ),
          if (controller.fieldType.type == EditType.email)
            FTextFormField.email(
              label: Text(controller.fieldType.label),
              hint: "peter.silie@gmx.net",
              control: .managed(
                initial: controller.field.value,
                onChange: (v) => controller.field.value = v,
              ),
            )
          else if (controller.fieldType.type == EditType.date)
            FDateField(
              label: Text(controller.fieldType.label),
              control: .managed(
                initial: controller.dateField.value,
                onChange: (v) => controller.dateField.value = v,
              ),
            )
          else
            FTextFormField(
              label: Text(controller.fieldType.label),
              hint: switch (controller.fieldType.type) {
                EditType.name => "Peter Silie",
                EditType.iban => "AT56 7312 0989 1199",
                _ => "",
              },
              control: .managed(
                initial: controller.field.value,
                onChange: (v) => controller.field.value = v,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => ((value?.length ?? 0) >= 1)
                  ? null
                  : "Der eingegebene Titel ist zu kurz.",
            ),
          const SizedBox(height: 20),
          FButton(
            onPress: controller.save,
            child: const Text("Speichern"),
          ),
          const BottomSpacing(),
        ],
      ),
    ),
  );
}
