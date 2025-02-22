import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

final defaultCardStyle = PlayingCardViewStyle(
  surfaceTintColor: Colors.yellowAccent,
  suitStyles: {
    Suit.spades: SuitStyle(
      cardContentBuilders: {
        CardValue.two:
            (context) =>
                Image.asset("assets/monsters/kobold.jpg", fit: BoxFit.cover),
        CardValue.three:
            (context) =>
                Image.asset("assets/monsters/skeleton.jpg", fit: BoxFit.cover),
        CardValue.four:
            (context) => Image.asset(
              "assets/monsters/hell hound.webp",
              fit: BoxFit.cover,
            ),
        CardValue.five:
            (context) =>
                Image.asset("assets/monsters/ghost.webp", fit: BoxFit.cover),
        CardValue.six:
            (context) =>
                Image.asset("assets/monsters/peagasus.webp", fit: BoxFit.cover),
        CardValue.seven:
            (context) =>
                Image.asset("assets/monsters/hag.webp", fit: BoxFit.cover),
        CardValue.eight:
            (context) =>
                Image.asset("assets/monsters/minotaur.webp", fit: BoxFit.cover),
        CardValue.nine:
            (context) =>
                Image.asset("assets/monsters/wyvern.webp", fit: BoxFit.cover),
        CardValue.ten:
            (context) =>
                Image.asset("assets/monsters/medusa.webp", fit: BoxFit.cover),
        CardValue.jack:
            (context) =>
                Image.asset("assets/monsters/mage.webp", fit: BoxFit.cover),
        CardValue.queen:
            (context) =>
                Image.asset("assets/monsters/sinister.webp", fit: BoxFit.cover),
        CardValue.king:
            (context) => Image.asset(
              "assets/monsters/red dragon.webp",
              fit: BoxFit.cover,
            ),
        CardValue.ace:
            (context) =>
                Image.asset("assets/monsters/devil.webp", fit: BoxFit.cover),
      },
    ),
    Suit.clubs: SuitStyle(
      cardContentBuilders: {
        CardValue.two:
            (context) =>
                Image.asset("assets/monsters/rat.jpg", fit: BoxFit.cover),
        CardValue.three:
            (context) =>
                Image.asset("assets/monsters/goblin.webp", fit: BoxFit.cover),
        CardValue.four:
            (context) =>
                Image.asset("assets/monsters/zombie.webp", fit: BoxFit.cover),
        CardValue.five:
            (context) =>
                Image.asset("assets/monsters/werewolf.webp", fit: BoxFit.cover),
        CardValue.six:
            (context) =>
                Image.asset("assets/monsters/orc.webp", fit: BoxFit.cover),
        CardValue.seven:
            (context) =>
                Image.asset("assets/monsters/ghoul.jpg", fit: BoxFit.cover),
        CardValue.eight:
            (context) =>
                Image.asset("assets/monsters/yuan ti.jpg", fit: BoxFit.cover),
        CardValue.nine:
            (context) =>
                Image.asset("assets/monsters/troll.jpg", fit: BoxFit.cover),
        CardValue.ten:
            (context) =>
                Image.asset("assets/monsters/beholder.jpg", fit: BoxFit.cover),
        CardValue.jack:
            (context) =>
                Image.asset("assets/monsters/vampire.jpg", fit: BoxFit.cover),
        CardValue.queen:
            (context) => Image.asset(
              "assets/monsters/skeleton king.jpg",
              fit: BoxFit.cover,
            ),
        CardValue.king:
            (context) =>
                Image.asset("assets/monsters/demon.jpg", fit: BoxFit.cover),
        CardValue.ace:
            (context) => Image.asset(
              "assets/monsters/death lord.jpg",
              fit: BoxFit.cover,
            ),
      },
    ),
    Suit.hearts: SuitStyle(),
    Suit.diamonds: SuitStyle(),
  },
);
