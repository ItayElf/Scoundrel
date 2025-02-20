import 'package:playing_cards/playing_cards.dart'
    show CardValue, PlayingCard, STANDARD_SUITS, Suit;

const _numbersValues = [
  CardValue.two,
  CardValue.three,
  CardValue.four,
  CardValue.five,
  CardValue.six,
  CardValue.seven,
  CardValue.eight,
  CardValue.nine,
  CardValue.ten,
];

const _nobilityValues = [
  CardValue.jack,
  CardValue.queen,
  CardValue.king,
  CardValue.ace,
];

List<PlayingCard> getBaseSet() {
  List<PlayingCard> cards = [];

  for (Suit suit in STANDARD_SUITS) {
    for (CardValue v in _numbersValues) {
      cards.add(PlayingCard(suit, v));
    }
  }

  for (Suit suit in [Suit.clubs, Suit.spades]) {
    for (CardValue v in _nobilityValues) {
      cards.add(PlayingCard(suit, v));
    }
  }

  return cards;
}
