import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class Weapon extends StatelessWidget {
  const Weapon({super.key, required this.weapon, required this.slainMonsters});

  final PlayingCard? weapon;
  final List<PlayingCard> slainMonsters;

  static const cardHeight = 150.0;
  static const monsterPadding = 30;

  @override
  Widget build(BuildContext context) {
    assert(
      weapon != null || slainMonsters.isEmpty,
    ); // Make sure that if the weapon is null the monsters are empty

    final cards = weapon == null ? [] : [weapon, ...slainMonsters];

    return SizedBox(
      width:
          cardHeight * playingCardAspectRatio +
          monsterPadding * slainMonsters.length,
      child: FlatCardFan(
        children:
            cards
                .map(
                  (c) => SizedBox(
                    height: cardHeight,
                    child: PlayingCardView(card: c, elevation: 2),
                  ),
                )
                .toList(),
      ),
    );
  }
}
