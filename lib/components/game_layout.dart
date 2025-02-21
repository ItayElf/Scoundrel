import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/deck.dart';
import 'package:scoundrel/components/game_footer.dart';
import 'package:scoundrel/components/room_area.dart';
import 'package:scoundrel/components/run_button.dart';

class GameLayout extends StatelessWidget {
  const GameLayout({
    super.key,
    required this.cardsInDeck,
    required this.roomCards,
    required this.weapon,
    required this.slainMonsters,
    required this.currentHealth,
    required this.onCardPlay,
    required this.useWeapon,
    required this.onToggleUseWeapon,
    required this.canRun,
    required this.onRun,
    required this.maxScore,
    required this.currentScore,
  });

  final int cardsInDeck;
  final List<PlayingCard?> roomCards;
  final PlayingCard? weapon;
  final List<PlayingCard> slainMonsters;
  final int currentHealth;
  final void Function(PlayingCard) onCardPlay;
  final bool useWeapon;
  final void Function() onToggleUseWeapon;
  final bool canRun;
  final void Function() onRun;
  final int maxScore;
  final int currentScore;

  static const cardHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                height:
                    MediaQuery.of(context).size.height / 2 +
                    1.2 * cardsInDeck +
                    30,
                width: cardHeight * playingCardAspectRatio,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        alignment: Alignment(0, -0.5),
                        children: [
                          Deck(numberOfCards: cardsInDeck),
                          RunButton(canRun: canRun, onRun: onRun),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "Score:\n$currentScore / $maxScore",
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoomArea(roomCards: roomCards, onChoice: onCardPlay),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (3 / 4),
                    child: GameFooter(
                      weapon: weapon,
                      slainMonsters: slainMonsters,
                      currentHealth: currentHealth,
                      useWeapon: useWeapon,
                      onToggleUseWeapon: onToggleUseWeapon,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
