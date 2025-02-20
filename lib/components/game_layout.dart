import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/deck.dart';
import 'package:scoundrel/components/game_footer.dart';
import 'package:scoundrel/components/room_area.dart';

class GameLayout extends StatelessWidget {
  const GameLayout({
    super.key,
    required this.cardsInDeck,
    required this.roomCards,
    required this.weapon,
    required this.slainMonsters,
    required this.currentHealth,
  });

  final int cardsInDeck;
  final List<PlayingCard?> roomCards;
  final PlayingCard? weapon;
  final List<PlayingCard> slainMonsters;
  final int currentHealth;

  static const cardHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height:
                  MediaQuery.of(context).size.height / 2 + 1.2 * cardsInDeck,
              width: cardHeight * playingCardAspectRatio,
              child: Deck(numberOfCards: cardsInDeck),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoomArea(roomCards: roomCards),
                SizedBox(
                  width: MediaQuery.of(context).size.width * (3 / 4),
                  child: GameFooter(
                    weapon: weapon,
                    slainMonsters: slainMonsters,
                    currentHealth: currentHealth,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
