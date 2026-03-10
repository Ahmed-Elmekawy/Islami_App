import 'package:flutter/material.dart';

class DateColumn extends StatelessWidget {
  final String line1;
  final String line2;

  const DateColumn({super.key, required this.line1, required this.line2});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(line1, style: Theme.of(context).textTheme.bodyLarge),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(line2, style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
    );
  }
}
