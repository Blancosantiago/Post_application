import 'package:challenge_application/application/application_themes.dart';
import 'package:flutter/material.dart';

class ErrorContainerMessage extends StatelessWidget {
  final String? _message;
  const ErrorContainerMessage({
    String? messagee,
    super.key,
  }) : _message = messagee;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              _message ?? "Something went wrong",
              style:
                  ApplicationThemes.quickSandBold.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
