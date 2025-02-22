import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

final defaultCardStyle = PlayingCardViewStyle(
  surfaceTintColor: Colors.yellowAccent,
  suitStyles: {
    Suit.spades: SuitStyle(),
    Suit.clubs: SuitStyle(),
    Suit.hearts: SuitStyle(),
    Suit.diamonds: SuitStyle(),
  },
);
