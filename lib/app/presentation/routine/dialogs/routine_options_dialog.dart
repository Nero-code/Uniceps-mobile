import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/account_limit_alert.dart';
import 'package:uniceps/core/widgets/premium_alert.dart';
import 'package:uniceps/l10n/app_localizations.dart';

enum Option { edit, delete, export, setCurrent }

class RoutineOptionsDialog extends StatelessWidget {
  const RoutineOptionsDialog({super.key, required this.routineName});

  final String routineName;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      backgroundColor: colorScheme.surface,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Text(
              routineName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5),
            ),
            const SizedBox(height: 24),

            // Options
            _OptionTile(
              onTap: () => Navigator.pop(context, Option.setCurrent),
              icon: Icons.flag_rounded,
              label: locale.setCurrent,
              color: Colors.green,
            ),
            _OptionTile(
              onTap: () => Navigator.pop(context, Option.edit),
              icon: Icons.edit_rounded,
              label: locale.rename,
              color: Colors.blueGrey,
            ),
            Builder(
              builder: (context) {
                final acc = context.watch<AccountCubit>();
                final mem = context.watch<MembershipBloc>();

                final hasAccount = acc.state.maybeWhen(hasAccount: (_) => true, orElse: () => false);
                final isPremium = mem.state.maybeWhen(loaded: (_) => true, orElse: () => false);

                return _OptionTile(
                  onTap: hasAccount
                      ? isPremium
                            ? () => Navigator.pop(context, Option.export)
                            : () => showDialog(context: context, builder: (_) => const PremiumAlert())
                      : () => showDialog(
                          context: context,
                          builder: (_) => AccountLimitAlert(content: locale.exportRoutineAuthAlertContent),
                        ),
                  icon: Icons.share_rounded,
                  label: locale.share,
                  color: Colors.blue,
                  trailing: !(hasAccount && isPremium)
                      ? const Image(image: AssetImage(IMG_PREMIUM), width: 20, height: 20, color: Colors.amber)
                      : null,
                );
              },
            ),
            const Divider(height: 32, indent: 16, endIndent: 16),
            _OptionTile(
              onTap: () => Navigator.pop(context, Option.delete),
              icon: Icons.delete_outline_rounded,
              label: locale.delete,
              color: Colors.red,
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final Color color;
  final Widget? trailing;
  final bool isDestructive;

  const _OptionTile({
    required this.onTap,
    required this.icon,
    required this.label,
    required this.color,
    this.trailing,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: isDestructive ? color.withValues(alpha: 0.05) : color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isDestructive ? color : colorScheme.onSurface,
                    ),
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
