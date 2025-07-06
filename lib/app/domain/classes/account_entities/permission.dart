/// Shortcuts:
///
/// * c:  `create`.
enum Actions { cRoutine, cDay, cItem, cSet }

class Permission {
  final Actions action;
  final int? maxCount;

  const Permission({required this.action, required this.maxCount});
}
