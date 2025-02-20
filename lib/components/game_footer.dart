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
    required this.useWeapon,
    required this.onToggleUseWeapon,
  });

  final PlayingCard? weapon;
  final List<PlayingCard> slainMonsters;
  final int currentHealth;
  final bool useWeapon;
  final void Function() onToggleUseWeapon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Weapon(
          weapon: weapon,
          slainMonsters: slainMonsters,
          useWeapon: useWeapon,
          onToggleUseWeapon: onToggleUseWeapon,
        ),
        Health(currentHealth: currentHealth),
      ],
    );
  }
}
