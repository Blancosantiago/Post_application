import 'package:challenge_application/application/application_themes.dart';
import 'package:flutter/material.dart';

class TextSimpleBody extends StatelessWidget {
  final String _text;
  const TextSimpleBody({
    super.key,
    required String text,
  }) : _text = text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _text,
        style: ApplicationThemes.quickSandBold,
      ),
    );
  }
}
