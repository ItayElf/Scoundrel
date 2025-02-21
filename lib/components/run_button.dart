import 'package:flutter/material.dart';

class RunButton extends StatelessWidget {
  const RunButton({super.key, required this.canRun, required this.onRun});

  final bool canRun;
  final void Function() onRun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: canRun ? onRun : null,
      child: Icon(Icons.directions_run, size: 36),
    );
  }
}
