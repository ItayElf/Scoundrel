import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

class RoomArea extends StatelessWidget {
  const RoomArea({super.key, required this.roomCards, required this.onChoice});

  final List<PlayingCard?> roomCards;
  final void Function(PlayingCard) onChoice;

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
                          child: InkWell(
                            onTap: () => onChoice(c),
                            child: PlayingCardView(card: c),
                          ),
                        ),
              )
              .toList(),
    );
  }
}
