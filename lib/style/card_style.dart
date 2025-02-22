import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

final defaultCardStyle = PlayingCardViewStyle(
  surfaceTintColor: Colors.yellowAccent,
  suitStyles: {
    Suit.spades: SuitStyle(
      cardContentBuilders: {
        CardValue.two: (context) => Image.asset("assets/monsters/kobold.jpg"),
        CardValue.three:
            (context) => Image.asset("assets/monsters/skeleton.jpg"),
        CardValue.four:
            (context) => Image.asset("assets/monsters/hell hound.webp"),
        CardValue.five: (context) => Image.asset("assets/monsters/ghost.webp"),
        CardValue.six:
            (context) => Image.asset("assets/monsters/peagasus.webp"),
        CardValue.seven: (context) => Image.asset("assets/monsters/hag.webp"),
        CardValue.eight:
            (context) => Image.asset("assets/monsters/minotaur.webp"),
      },
    ),
    Suit.clubs: SuitStyle(
      cardContentBuilders: {
        CardValue.two: (context) => Image.asset("assets/monsters/rat.jpg"),
        CardValue.three:
            (context) => Image.asset("assets/monsters/goblin.webp"),
        CardValue.four: (context) => Image.asset("assets/monsters/zombie.webp"),
        CardValue.five:
            (context) => Image.asset("assets/monsters/werewolf.webp"),
        CardValue.six: (context) => Image.asset("assets/monsters/orc.webp"),
        CardValue.seven: (context) => Image.asset("assets/monsters/ghoul.jpg"),
        CardValue.eight:
            (context) => Image.asset("assets/monsters/yuan ti.jpg"),
      },
    ),
    Suit.hearts: SuitStyle(),
    Suit.diamonds: SuitStyle(),
  },
);
