import "package:diehugosapp/presentation/screens/cashpool/detail/create_transaction_sheet/cashpool_create_transaction_sheet_controller.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";

class CashpoolCreateTransactionSheet
    extends GetView<CashpoolCreateTransactionSheetController> {
  const CashpoolCreateTransactionSheet({super.key});

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
        child: SafeArea(
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                "Transaktion hinzufügen",
                style: theme.typography.xl2.copyWith(
                  fontWeight: .w600,
                  color: theme.colors.foreground,
                  height: 1.5,
                ),
              ),
              SizedBox(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      FSelectTileGroup<String>(
                        control: .managedRadio(
                          initial: "expense",
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
                      const SizedBox(height: 12),
                      FTextFormField(
                        label: const Text("Bezeichnung"),
                        hint: "Alkshopping",
                        control: .managed(
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
                          onChange: (v) => controller.amountCents.value = v,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: controller.validateAmountField,
                      ),
                      const SizedBox(height: 20),
                      FButton(
                        size: .sm,
                        onPress: controller.handleCreateTransaction,
                        child: const Text("Speichern"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
