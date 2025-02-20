import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/deck.dart';
import 'package:scoundrel/components/game_footer.dart';
import 'package:scoundrel/components/room_area.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2 + 1.2 * 50,
              width: 200 * playingCardAspectRatio,
              child: Deck(numberOfCards: 50),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoomArea(
                  roomCards: [
                    PlayingCard(Suit.clubs, CardValue.ace),
                    PlayingCard(Suit.diamonds, CardValue.four),
                    PlayingCard(Suit.hearts, CardValue.nine),
                    PlayingCard(Suit.spades, CardValue.seven),
                  ],
                ),
                GameFooter(
                  weapon: PlayingCard(Suit.diamonds, CardValue.seven),
                  slainMonsters: [
                    PlayingCard(Suit.clubs, CardValue.seven),
                    PlayingCard(Suit.clubs, CardValue.seven),
                    PlayingCard(Suit.clubs, CardValue.seven),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
