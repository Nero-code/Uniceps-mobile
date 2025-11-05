import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';
import 'package:uniceps/app/presentation/home/widgets/alert_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/plans/screens/plans_screen.dart';
import 'package:uniceps/core/constants/app_routes.dart';

class AccessControlWidget extends StatelessWidget {
  const AccessControlWidget({super.key, required this.onClose});

  final VoidCallback onClose;
  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Builder(
      builder: (context) {
        final accountCubit = context.watch<AccountCubit>();
        final membershipBloc = context.watch<MembershipBloc>();

        return accountCubit.state.map(
          initial: (s) => const SizedBox(),
          unauthenticated: (s) => AlertBar(
            content: Text(
              locale.signinAlert,
              style: const TextStyle(fontSize: 12),
            ),
            actionText: locale.signin,
            action: () => Navigator.pushNamed(context, AppRoutes.auth),
          ),
          hasAccount: (acc) => membershipBloc.state.maybeMap(
            orElse: () => const SizedBox(),
            error: (err) => err.f.map(
                cantGetPlan: (f) => AlertBar(
                      color: Colors.teal,
                      foregroundColor: Colors.white70,
                      content: Text(
                        locale.upgradeAlert,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 255, 222, 132)),
                      ),
                      actionText: locale.upgrade,
                      action: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<MembershipBloc>(),
                            child: const PlansScreen(),
                          ),
                        ),
                      ),
                      close: onClose,
                    )),
          ),
        );
      },
    );
  }
}
