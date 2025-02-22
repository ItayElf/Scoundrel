import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/style/card_style.dart';

class RoomArea extends StatelessWidget {
  const RoomArea({super.key, required this.roomCards, required this.onChoice});

  final List<PlayingCard?> roomCards;
  final void Function(PlayingCard) onChoice;

  static const cardHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          roomCards
              .map(
                (c) =>
                    c == null
                        ? SizedBox(
                          height: cardHeight,
                          width: cardHeight * playingCardAspectRatio,
                          child: Card(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white, // Border color
                                width: 2, // Border width
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // Optional rounded corners
                            ),
                          ),
                        )
                        : SizedBox(
                          height: 200,
                          child: InkWell(
                            onTap: () => onChoice(c),
                            child: PlayingCardView(
                              card: c,
                              style: defaultCardStyle,
                            ),
                          ),
                        ),
              )
              .toList(),
    );
  }
}
