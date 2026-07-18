import "package:diehugosapp/core/utils/ui_state.dart";
import "package:diehugosapp/presentation/screens/cashpool/detail/settle/settlements/settlement_details_sheet/cashpool_settlement_transaction_details_controller.dart";
import "package:diehugosapp/presentation/styles.dart";
import "package:diehugosapp/presentation/widgets/bottom_sheet_container.dart";
import "package:diehugosapp/presentation/widgets/bottom_spacing.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:get/get.dart";
import "package:qr_flutter/qr_flutter.dart";

class CashpoolSettlementTransactionDetailsSheet
    extends GetView<CashpoolSettlementTransactionDetailsController> {
  const CashpoolSettlementTransactionDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FThemeBuildContext(context).theme;

    return BottomSheetContainer(
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Text(
            "Abrechnungsdetails",
            style: Styles.titleStyle,
          ),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                FTextFormField(
                  label: const Text("Verwendungszweck"),
                  hint: "Abrechnung vom 1.1.2026",
                  control: .managed(
                    initial: controller.purpose.value,
                    onChange: (v) {
                      controller.purpose.value = v;
                      controller.computeQrCodeInfo();
                    },
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: controller.validatePurposeField,
                ),
                const SizedBox(height: 12),
                FTextFormField(
                  label: const Text("Betrag"),
                  hint: "10€",
                  control: .managed(
                    initial: controller.amountCents.value,
                    onChange: (v) {
                      controller.amountCents.value = v;
                      controller.computeQrCodeInfo();
                    },
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: controller.validateAmountField,
                ),
                const SizedBox(height: 20),
                FTile(
                  title: Center(
                    child: Obx(
                      () {
                        if (controller.sepaCodeData.value == null ||
                            controller.qrState.value == UiState.error()) {
                          if (controller.qrState.value ==
                              UiState.error("no_account_info")) {
                            return const Text(
                              "Der Nutzer hat keine Konteninformationen hinterlegt.",
                              softWrap: true,
                              maxLines: 3,
                            );
                          }
                          return const Text(
                            "QR-Code kann nicht generiert werden.",
                          );
                        }

                        if (controller.qrState.value == UiState.loading()) {
                          return const FCircularProgress();
                        }

                        return QrImageView(
                          size: 200,
                          data: controller.sepaCodeData.value!,
                          eyeStyle: QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: theme.colors.foreground,
                          ),
                          dataModuleStyle: QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.square,
                            color: theme.colors.foreground,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => FButton(
                    onPress: controller.isSettleable
                        ? () => controller.handleSettleSettlementAction()
                        : null,
                    child: const Text("Geld wurde überwiesen"),
                  ),
                ),
                const BottomSpacing(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
