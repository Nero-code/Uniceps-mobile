import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uniceps/app/presentation/settings/cubits/gym_qr/gym_qr_cubit.dart';
import 'package:uniceps/core/widgets/loading_page.dart';
import 'package:uniceps/injection_dependency.dart' as di;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrAlertDialog extends StatefulWidget {
  const QrAlertDialog({super.key});

  @override
  State<QrAlertDialog> createState() => _QrAlertDialogState();
}

class _QrAlertDialogState extends State<QrAlertDialog> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final screenSize = MediaQuery.sizeOf(context);
    return BlocProvider(
      lazy: false,
      create: (context) => GymQrCubit(prefs: di.sl())..getQr(),
      child: AlertDialog(
        scrollable: true,
        content: BlocBuilder<GymQrCubit, GymQrState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const SizedBox(),
              loading: (_) => const LoadingIndicator(),
              loaded: (s) {
                controller.text = s.qr;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (s.qr.isNotEmpty)
                      QrImageView(
                        data: s.qr,
                        size: 200,
                        errorStateBuilder: (context, error) => Center(
                          child: Text(locale.codeError),
                        ),
                      ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: screenSize.width * .5,
                      // height: 50,
                      child: Center(
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: TextField(
                            controller: controller,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            maxLength: 6,
                            decoration: const InputDecoration(
                              label: Text('Qr-Code'),
                              hintText: 'xxx-xxx',
                              isDense: true,
                            ),
                            onSubmitted: (value) => context.read<GymQrCubit>().saveQr(value),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: screenSize.width * .5,
                      child: ElevatedButton(
                        onPressed: () => context.read<GymQrCubit>().saveQr(controller.text),
                        child: Text(locale.save),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
