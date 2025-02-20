import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class Deck extends StatelessWidget {
  const Deck({super.key, required this.numberOfCards});

  final int numberOfCards;

  static const cardHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: Colors.black, width: 0.5),
    );

    return Stack(
      children: List.generate(numberOfCards, (index) {
        return Positioned(
          top: (numberOfCards - index) * 1.2,
          child: SizedBox(
            height: cardHeight,
            child: PlayingCardView(
              card: PlayingCard(Suit.joker, CardValue.joker_1),
              showBack: true,
              elevation: 0,
              shape: shape,
            ),
          ),
        );
      }),
    );
  }
}
