import 'package:f1_stats/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Reset Password',
    content:
        'Reset password email has been sent to your email address. Please check your email for more information',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
