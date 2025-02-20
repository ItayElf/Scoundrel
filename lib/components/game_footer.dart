import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/health.dart';
import 'package:scoundrel/components/weapon.dart';

class GameFooter extends StatelessWidget {
  const GameFooter({
    super.key,
    required this.weapon,
    required this.slainMonsters,
    required this.currentHealth,
  });

  final PlayingCard? weapon;
  final List<PlayingCard> slainMonsters;
  final int currentHealth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Weapon(weapon: weapon, slainMonsters: slainMonsters),
        Health(currentHealth: currentHealth),
      ],
    );
  }
}
