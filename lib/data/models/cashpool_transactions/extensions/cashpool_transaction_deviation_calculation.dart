import "package:diehugosapp/data/models/cashpool_transactions/cashpool_transaction.dart";
import "package:diehugosapp/data/models/user/user.dart";

extension CashpoolCalculations on Iterable<CashpoolTransaction> {
  /// Returns the deviation in cents.
  /// Positive value = User overpaid (is owed money).
  /// Negative value = User underpaid (owes money).
  int getUserDeviation(User targetUser, {int? explicitMemberCount}) {
    if (isEmpty) return 0;

    // 1. Calculate the total pool amount
    final totalCents = fold<int>(0, (sum, tx) => sum + tx.amountCents);

    // 2. Determine member count
    final numMembers =
        explicitMemberCount ?? map((tx) => tx.owner).toSet().length;
    if (numMembers == 0) return 0;

    // 3. Calculate fair share per person
    final fairShare = totalCents / numMembers;

    // 4. Calculate target user's total contribution
    final userContribution = where(
      (tx) => tx.owner == targetUser,
    ).fold<int>(0, (sum, tx) => sum + tx.amountCents);

    return (userContribution - fairShare).toInt();
  }
}
