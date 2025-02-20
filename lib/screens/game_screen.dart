import 'package:flutter/material.dart';
import 'package:scoundrel/components/deck.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(child: Center(child: Deck(numberOfCards: 50)));
  }
}
