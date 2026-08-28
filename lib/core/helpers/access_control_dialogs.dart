import 'package:flutter/material.dart';
import 'package:uniceps/core/widgets/account_limit_alert.dart';
import 'package:uniceps/core/widgets/premium_alert.dart';

Future<T?> showAuthDialog<T>(BuildContext context, {String content = ''}) => showDialog<T>(
  context: context,
  builder: (context) => AccountLimitAlert(content: content),
);

Future<T?> showPremiumDialog<T>(BuildContext context) =>
    showDialog<T>(context: context, builder: (context) => const PremiumAlert());
