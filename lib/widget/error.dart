import 'package:flutter/material.dart';

class ErrorNotif extends StatelessWidget {
  final String message;
  const ErrorNotif({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.message),
      actions: [
        TextButton(
          onPressed: () => {
            Navigator.of(context).pop(),
          },
          child: Text("OK"),
        )
      ],
    );
  }
}
