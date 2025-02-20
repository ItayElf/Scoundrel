import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/weapon.dart';

class GameFooter extends StatelessWidget {
  const GameFooter({
    super.key,
    required this.weapon,
    required this.slainMonsters,
  });

  final PlayingCard? weapon;
  final List<PlayingCard> slainMonsters;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Weapon(weapon: weapon, slainMonsters: slainMonsters)],
    );
  }
}
