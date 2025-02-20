import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class RoomArea extends StatelessWidget {
  const RoomArea({super.key, required this.roomCards});

  final List<PlayingCard?> roomCards;

  static const cardHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          roomCards
              .map(
                (c) =>
                    c == null
                        ? SizedBox(
                          height: cardHeight,
                          width: cardHeight * playingCardAspectRatio,
                        )
                        : SizedBox(
                          height: 200,
                          child: PlayingCardView(card: c),
                        ),
              )
              .toList(),
    );
  }
}
