import 'package:flutter/material.dart';

class Health extends StatelessWidget {
  const Health({super.key, required this.currentHealth});

  final int currentHealth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.favorite, size: 150, color: Colors.red),
          Text(
            "$currentHealth",
            style: TextStyle(fontSize: 50, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
