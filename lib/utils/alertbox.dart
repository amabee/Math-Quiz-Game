import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class MyAlertBox {
  static void showCustomDialog({
    required BuildContext context,
    required String customMessage,
    required String imageLocation,
    required String resultMessage,
    required VoidCallback onPressed,
    required String buttonMessage,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GiffyDialog.image(
          Image.network(
            imageLocation,
            height: 200,
            fit: BoxFit.cover,
          ),
          title: Text(
            resultMessage,
            textAlign: TextAlign.center,
          ),
          content: Text(
            customMessage,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text(buttonMessage),
            ),
          ],
        );
      },
    );
  }
}
