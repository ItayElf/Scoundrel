import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/style/card_style.dart';

class Weapon extends StatelessWidget {
  const Weapon({
    super.key,
    required this.weapon,
    required this.slainMonsters,
    required this.useWeapon,
    required this.onToggleUseWeapon,
  });

  final PlayingCard? weapon;
  final List<PlayingCard> slainMonsters;
  final bool useWeapon;
  final void Function() onToggleUseWeapon;

  static const cardHeight = 150.0;
  static const monsterPadding = 30;

  @override
  Widget build(BuildContext context) {
    assert(
      weapon != null || slainMonsters.isEmpty,
    ); // Make sure that if the weapon is null the monsters are empty

    final cards = weapon == null ? [] : [weapon, ...slainMonsters];

    if (weapon == null) {
      return Row(
        children: [
          SizedBox(width: 50),
          SizedBox(
            height: cardHeight,
            width: cardHeight * playingCardAspectRatio,
            child: Placeholder(),
          ),
        ],
      );
    }

    final cardStack =
        cards
            .map(
              (c) => SizedBox(
                height: cardHeight,
                child: PlayingCardView(
                  card: c,
                  elevation: 2,
                  style: defaultCardStyle,
                ),
              ),
            )
            .toList();

    return Row(
      children: [
        IconButton(
          onPressed: onToggleUseWeapon,
          icon: Icon(Icons.sports_mma),
          iconSize: 50,
          color: useWeapon ? Colors.red : Colors.grey,
        ),
        SizedBox(
          width:
              cardHeight * playingCardAspectRatio +
              monsterPadding * slainMonsters.length,
          child: FlatCardFan(children: cardStack),
        ),
      ],
    );
  }
}
