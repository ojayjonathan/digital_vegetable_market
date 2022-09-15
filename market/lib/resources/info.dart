import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:market/data/error/error_object.dart';

enum MessageType { success, warning, error, info }

class InfoMessage extends Equatable {
  final String message;
  final MessageType type;
  const InfoMessage({
    required this.message,
    required this.type,
  });
  factory InfoMessage.fromError(ErrorObject errorObject) {
    return InfoMessage(message: errorObject.message, type: MessageType.error);
  }
  @override
  List<Object?> get props => [message, type];
}

extension MessageX on InfoMessage {
  Color get color {
    if (type == MessageType.success) {
      return Colors.greenAccent;
    }
    if (type == MessageType.error) {
      return Colors.red[700]!;
    }

    return Colors.amber;
  }

  TextStyle get style {
    return TextStyle(color: color);
  }
}

extension Info on BuildContext {
  errorDialog({required String message, String? title, Function()? retry}) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("CLOSE"),
            ),
            if (retry != null)
              TextButton(
                onPressed: () {
                  retry();
                  Navigator.of(context).pop();
                },
                child: const Text("RETRY"),
              )
          ],
          title: Text(title ?? "ERROR"),
        );
      },
    );
  }

  successDialog({required String message, String? title}) {
    showDialog(
      context: this,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("CLOSE"),
            ),
          ],
          title: Text(title ?? "SUCCESS"),
        );
      },
    );
  }

  snackBar(
    InfoMessage message, {
    Duration duration = const Duration(
      milliseconds: 10000,
    ),
  }) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message.message,
          style: message.style,
        ),
        duration: duration,
      ),
    );
  }
}
