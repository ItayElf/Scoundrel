import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/deck.dart';
import 'package:scoundrel/components/game_footer.dart';
import 'package:scoundrel/components/game_layout.dart';
import 'package:scoundrel/components/room_area.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GameLayout(
      currentHealth: 20,
      cardsInDeck: 50,
      weapon: PlayingCard(Suit.diamonds, CardValue.seven),
      roomCards: [
        PlayingCard(Suit.clubs, CardValue.ace),
        PlayingCard(Suit.diamonds, CardValue.four),
        PlayingCard(Suit.hearts, CardValue.nine),
        PlayingCard(Suit.spades, CardValue.seven),
      ],
      slainMonsters: [
        PlayingCard(Suit.clubs, CardValue.seven),
        PlayingCard(Suit.clubs, CardValue.seven),
        PlayingCard(Suit.clubs, CardValue.seven),
      ],
    );
  }
}
