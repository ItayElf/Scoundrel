import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'package:scoundrel/components/game_layout.dart';
import 'package:scoundrel/logic/cards.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late int maxScore;

  bool didHeal = false;
  bool useWeapon = false;
  bool canRun = true;

  static const maxHealth = 20;

  @override
  void initState() {
    super.initState();
    deckCards.shuffle();

    final drawSize = min(deckCards.length, 4);

    roomCards = deckCards.sublist(0, drawSize);
    deckCards.removeRange(0, drawSize);
    maxScore = getMaxScore();
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
    canRun = true;
  }

  List<PlayingCard> drawNewRoom() {
    // setState is called by caller
    final drawSize = min(deckCards.length, 3);
    final drawn = deckCards.sublist(0, drawSize);
    deckCards.removeRange(0, drawSize);
    return drawn;
  }

  bool _cardsEqual(PlayingCard? a, PlayingCard? b) =>
      a?.suit == b?.suit && a?.value == b?.value;

  bool _isMonster(PlayingCard c) => [Suit.clubs, Suit.spades].contains(c.suit);

  int getMaxScore() {
    final enemies = getBaseSet().where(_isMonster).map(getCardValue);
    if (enemies.isEmpty) {
      return 0;
    }

    return enemies.reduce((a, b) => a + b);
  }

  int getCurrentScore() {
    List<PlayingCard> currentMonsters = [
      ...deckCards.where(_isMonster),
      ...roomCards
          .where((c) => c != null)
          .cast<PlayingCard>()
          .where(_isMonster),
    ];

    if (currentMonsters.isEmpty) {
      return maxScore;
    }

    final leftScore = currentMonsters.map(getCardValue).reduce((a, b) => a + b);

    return maxScore - leftScore;
  }

  void onRun() {
    canRun = false;
    didHeal = false;

    deckCards.addAll(roomCards.cast());
    setState(() {
      roomCards = deckCards.sublist(0, 4);
      deckCards.removeRange(0, 4);
    });
  }

  void showDialogOnGameOver(BuildContext context) {
    final score = getCurrentScore();

    onPressed() {
      SharedPreferences.getInstance().then((perfs) {
        perfs.setInt("highScore", max(perfs.getInt("highScore") ?? 0, score));
        if (context.mounted) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      });
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("You Died!"),
            content: Text("Score: $score", style: TextStyle(fontSize: 20)),
            actions: [
              TextButton(
                onPressed: onPressed,
                child: Text("OK", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentHealth == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialogOnGameOver(context);
      });
    }

    return GameLayout(
      currentHealth: currentHealth,
      cardsInDeck: deckCards.length,
      weapon: weapon,
      roomCards: roomCards,
      slainMonsters: slainMonsters,
      onCardPlay: onCardPlay,
      useWeapon: useWeapon,
      onToggleUseWeapon: () {
        setState(() {
          useWeapon = !useWeapon;
        });
      },
      canRun: canRun && roomCards.where((c) => c != null).length == 4,
      onRun: onRun,
      maxScore: maxScore,
      currentScore: getCurrentScore(),
    );
  }
}
