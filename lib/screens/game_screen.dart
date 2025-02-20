import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/game_layout.dart';
import 'package:scoundrel/logic/cards.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int currentHealth = 20;
  PlayingCard? weapon;
  List<PlayingCard> deckCards = getBaseSet();
  List<PlayingCard> slainMonsters = [];
  late List<PlayingCard?> roomCards;

  @override
  void initState() {
    super.initState();
    deckCards.shuffle();
    roomCards = deckCards.sublist(0, 4);
    deckCards.removeRange(0, 4);
  }

  void onCardPlay(PlayingCard card) {
    if (card.suit == Suit.hearts) {
      onHeartsPlay(card);
    } else if (card.suit == Suit.diamonds) {
      onWeaponPlay(card);
    } else {
      onMonsterPlay(card);
    }
    final newRoomCards =
        roomCards.map((c) => _cardsEqual(c, card) ? null : c).toList();

    setState(() {
      roomCards = newRoomCards;
    });
  }

  void onHeartsPlay(PlayingCard card) {
    print("Heart");
  }

  void onWeaponPlay(PlayingCard card) {
    print("Weapon");
  }

  void onMonsterPlay(PlayingCard card) {
    print("Monster");
  }

  bool _cardsEqual(PlayingCard? a, PlayingCard? b) =>
      a?.suit == b?.suit && a?.value == b?.value;

  @override
  Widget build(BuildContext context) {
    return GameLayout(
      currentHealth: currentHealth,
      cardsInDeck: deckCards.length,
      weapon: weapon,
      roomCards: roomCards,
      slainMonsters: slainMonsters,
      onCardPlay: onCardPlay,
    );
  }
}
