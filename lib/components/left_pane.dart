import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/deck.dart';
import 'package:scoundrel/components/run_button.dart';

class LeftPane extends StatelessWidget {
  const LeftPane({
    super.key,
    required this.cardsInDeck,
    required this.cardHeight,
    required this.canRun,
    required this.onRun,
    required this.currentScore,
    required this.maxScore,
  });

  final int cardsInDeck;
  final double cardHeight;
  final bool canRun;
  final void Function() onRun;
  final int currentScore;
  final int maxScore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2 + 1.2 * cardsInDeck + 30,
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
    );
  }
}
