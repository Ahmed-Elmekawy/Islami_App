import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String errorMessage;
  const ErrorMessage(this.errorMessage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
