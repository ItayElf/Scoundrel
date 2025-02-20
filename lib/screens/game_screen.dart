import 'dart:math';

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
  int currentHealth = maxHealth;
  PlayingCard? weapon;
  List<PlayingCard> deckCards = getBaseSet();
  List<PlayingCard> slainMonsters = [];
  late List<PlayingCard?> roomCards;

  bool didHeal = false;
  bool useWeapon = false;

  static const maxHealth = 20;

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

    List<PlayingCard?> newRoomCards =
        roomCards.map((c) => _cardsEqual(c, card) ? null : c).toList();

    final notNullRoomCards = newRoomCards.where((c) => c != null).toList();

    if (notNullRoomCards.length == 1) {
      onNewRoom();
      newRoomCards = [notNullRoomCards.first, ...drawNewRoom()];
    }

    setState(() {
      roomCards = newRoomCards;
    });
  }

  void onHeartsPlay(PlayingCard card) {
    if (didHeal) return;

    currentHealth = min(currentHealth + getCardValue(card), maxHealth);
    didHeal = true;
  }

  void onWeaponPlay(PlayingCard card) {
    // setState is called by caller
    weapon = PlayingCard(card.suit, card.value);
    slainMonsters.clear();
    useWeapon = true;
  }

  void onMonsterPlay(PlayingCard card) {
    if (weapon == null || !useWeapon) {
      currentHealth = max(0, currentHealth - getCardValue(card));
      return;
    }

    final minSlainMonster =
        slainMonsters.isEmpty ? 100 : getCardValue(slainMonsters.last);
    if (minSlainMonster <= getCardValue(card)) {
      currentHealth = max(0, currentHealth - getCardValue(card));
      return;
    }

    currentHealth = max(
      0,
      currentHealth - max(getCardValue(card) - getCardValue(weapon!), 0),
    );
    slainMonsters.add(PlayingCard(card.suit, card.value));
  }

  void onNewRoom() {
    didHeal = false;
  }

  List<PlayingCard> drawNewRoom() {
    // setState is called by caller
    final drawn = deckCards.sublist(0, 3);
    deckCards.removeRange(0, 3);
    return drawn;
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
