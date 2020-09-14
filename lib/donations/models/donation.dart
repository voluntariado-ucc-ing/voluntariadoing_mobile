import 'dart:convert';

import 'package:voluntariadoing_mobile/donations/models/direction.dart';

class Donation {
  int id;
  int typeId;
  int donorId;
  int quantity;
  String unit;
  String description;
  String element;
  DateTime date;
  Direction direction;

  Donation({
    this.id,
    this.typeId,
    this.donorId,
    this.quantity,
    this.unit,
    this.description,
    this.element,
    this.date,
    this.direction,
  });

  Map<String, dynamic> toMap() {
    return {
      'donation_id': id,
      'type_id': typeId,
      'donor_id': donorId,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'element': element,
      'date': date?.toString(),
      'direction': direction?.toMap(),
    };
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Donation(
      id: map['id'],
      typeId: map['type_id'],
      donorId: map['donor_id'],
      quantity: map['quantity'],
      unit: map['unit'],
      description: map['description'],
      element: map['element'],
      date: DateTime.tryParse(map['date']),
      direction: Direction.fromMap(map['direction']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Donation.fromJson(String source) =>
    Donation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Donation(id: $id, typeId: $typeId, donorId: $donorId,'
      'quantity: $quantity, unit: $unit, description: $description,'
      'element: $element, date: $date, direction: $direction)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Donation &&
      o.id == id &&
      o.typeId == typeId &&
      o.donorId == donorId &&
      o.quantity == quantity &&
      o.unit == unit &&
      o.description == description &&
      o.element == element &&
      o.date == date &&
      o.direction == direction;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      typeId.hashCode ^
      donorId.hashCode ^
      quantity.hashCode ^
      unit.hashCode ^
      description.hashCode ^
      element.hashCode ^
      date.hashCode ^
      direction.hashCode;
  }
}
