import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class RoomArea extends StatelessWidget {
  const RoomArea({super.key, required this.roomCards});

  final List<PlayingCard?> roomCards;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          roomCards
              .map(
                (c) =>
                    c == null
                        ? SizedBox(
                          height: 200,
                          width: 200 * playingCardAspectRatio,
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
