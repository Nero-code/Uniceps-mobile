import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/presentation/blocs/account/account_cubit.dart';
import 'package:uniceps/app/presentation/blocs/membership/membership_bloc.dart';

class AccessControlWidget extends StatelessWidget {
  const AccessControlWidget({super.key, required this.builder});

  final Widget Function(BuildContext context, bool authenticated, bool hasMembership) builder;

  @override
  Widget build(BuildContext context) {
    final authenticated = context.watch<AccountCubit>().state.maybeWhen(orElse: () => false, hasAccount: (_) => true);
    final hasMembership = context.watch<MembershipBloc>().state.maybeWhen(orElse: () => false, loaded: (m) => true);
    return builder(context, authenticated, hasMembership);
  }
}
