import "package:diehugosapp/presentation/screens/cashpool/detail/create_transaction_sheet/cashpool_create_transaction_controller.dart";
import "package:diehugosapp/presentation/styles.dart";
import "package:diehugosapp/presentation/widgets/async_button.dart";
import "package:diehugosapp/presentation/widgets/bottom_sheet_container.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolCreateTransactionSheet
    extends GetView<CashpoolCreateTransactionController> {
  const CashpoolCreateTransactionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemeBuildContext(context).theme;

    return BottomSheetContainer(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Obx(
            () => Text(
              controller.editingTransaction.value == null
                  ? "Transaktion hinzufügen"
                  : "Transaktion editieren",
              style: Styles.titleStyle,
            ),
          ),
          SizedBox(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Obx(
                    () => FSelectTileGroup<String>(
                      control: .managedRadio(
                        initial: controller.category.value,
                        onChange: (v) => controller.category.value = v.first,
                      ),
                      label: const Text("Kategorie"),
                      children: [
                        FSelectTile.suffix(
                          prefix: Icon(
                            FIcons.banknoteArrowDown,
                            color: theme.colors.error,
                          ),
                          title: const Text("Ausgabe"),
                          value: "expense",
                        ),
                        const FSelectTile.suffix(
                          prefix: Icon(
                            FIcons.banknoteArrowUp,
                            color: Colors.green,
                          ),
                          title: Text("Einnahme"),
                          value: "income",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  FTextFormField(
                    label: const Text("Bezeichnung"),
                    hint: "Alkshopping",
                    control: .managed(
                      initial: controller.label.value,
                      onChange: (v) => controller.label.value = v,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.validateLabelField,
                  ),
                  const SizedBox(height: 12),
                  FTextFormField(
                    label: const Text("Betrag"),
                    hint: "10€",
                    control: .managed(
                      initial: controller.amountCents.value,
                      onChange: (v) => controller.amountCents.value = v,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: controller.validateAmountField,
                  ),
                  const SizedBox(height: 20),
                  AsyncButton(
                    size: .sm,
                    onPress: controller.handleCreateOrEditTransaction,
                    child: const Text("Speichern"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
