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
  List<PlayingCard> cards = [PlayingCard(Suit.spades, CardValue.nine)];

  for (Suit suit in [Suit.diamonds, Suit.hearts]) {
    for (CardValue v in _nobilityValues) {
      cards.add(PlayingCard(suit, v));
    }
  }

  // for (Suit suit in [Suit.clubs, Suit.spades]) {
  //   for (CardValue v in _nobilityValues) {
  //     cards.add(PlayingCard(suit, v));
  //   }
  // }

  return cards;
}

int getCardValue(PlayingCard card) {
  return {
        CardValue.two: 2,
        CardValue.three: 3,
        CardValue.four: 4,
        CardValue.five: 5,
        CardValue.six: 6,
        CardValue.seven: 7,
        CardValue.eight: 8,
        CardValue.nine: 9,
        CardValue.ten: 10,
        CardValue.jack: 11,
        CardValue.queen: 12,
        CardValue.king: 13,
        CardValue.ace: 14,
      }[card.value] ??
      0;
}
