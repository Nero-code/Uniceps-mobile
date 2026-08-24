import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:uniceps/core/constants/app_routes.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/l10n/app_localizations.dart';

// Light Theme Palette Constants
const lightBg = Color(0xFFF6F8FA);
const cardSurface = Colors.white;
const primaryDark = Color(0xFF1E293B);
const primaryTeal = Color(0xFF0EA5E9);
const accentMint = Color(0xFF10B981);
const textSubtle = Color(0xFF64748B);
const borderLight = Color(0xFFE2E8F0);

class AlertBannerSection extends StatelessWidget {
  final bool notifyUpgrade;
  final VoidCallback onCloseUpgrade;

  const AlertBannerSection({super.key, required this.notifyUpgrade, required this.onCloseUpgrade});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final accountCubit = context.watch<AccountCubit>();
    final membershipBloc = context.watch<MembershipBloc>();

    return accountCubit.state.map(
      initial: (_) => const SizedBox.shrink(),
      unauthenticated: (_) => AlertBar(
        content: Text(locale.signinAlert, style: const TextStyle(fontSize: 12)),
        actionText: locale.signin,
        action: () => Navigator.pushNamed(context, AppRoutes.auth),
      ),
      hasAccount: (_) => membershipBloc.state.maybeMap(
        orElse: () => const SizedBox.shrink(),
        error: (err) => err.f.maybeMap(
          orElse: () => notifyUpgrade
              ? AlertBar(
                  color: primaryTeal.withOpacity(0.1),
                  foregroundColor: primaryTeal,
                  content: Text(
                    locale.upgradeAlert,
                    style: const TextStyle(fontSize: 12, color: primaryDark, fontWeight: FontWeight.w500),
                  ),
                  actionText: locale.upgrade,
                  action: () => Navigator.pushNamed(context, AppRoutes.plans),
                  close: onCloseUpgrade,
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
