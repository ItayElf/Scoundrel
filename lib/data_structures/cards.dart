import 'dart:convert';

import 'package:playing_cards/playing_cards.dart';

class Card {
  final Suit suit;
  final CardValue value;

  const Card({required this.suit, required this.value});

  Card copyWith({Suit? suit, CardValue? value}) {
    return Card(suit: suit ?? this.suit, value: value ?? this.value);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'suit': suit.toString(),
      'value': value.toString(),
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      suit: Suit.values.byName(map['suit']),
      value: CardValue.values.byName(map['value']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) =>
      Card.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Card(suit: $suit, value: $value)';

  @override
  bool operator ==(covariant Card other) {
    if (identical(this, other)) return true;

    return other.suit == suit && other.value == value;
  }

  @override
  int get hashCode => suit.hashCode ^ value.hashCode;
}
