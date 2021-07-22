import 'package:voluntariadoing_mobile/common/models/direction.dart';

enum DonationStatus { toBeConfirmed, toBeRetrieved, retrieved, rejected }

String donationStatusToKey(DonationStatus donationStatus) {
  switch (donationStatus) {
    case DonationStatus.toBeConfirmed:
      return 'to_be_confirmed';
    case DonationStatus.toBeRetrieved:
      return 'to_be_retrieved';
    case DonationStatus.retrieved:
      return 'retrieved';
    case DonationStatus.rejected:
      return 'rejected';
  }
  return null;
}

DonationStatus keyToDonationStatus(String key) {
  if (key == 'to_be_confirmed') {
    return DonationStatus.toBeConfirmed;
  } else if (key == 'to_be_retrieved') {
    return DonationStatus.toBeConfirmed;
  } else if (key == 'retrieved') {
    return DonationStatus.retrieved;
  } else if (key == 'rejected') {
    return DonationStatus.rejected;
  }
  return null;
}

class Donation {
  int id;
  int typeId;
  int donatorId;
  int quantity;
  String unit;
  String description;
  String element;
  DateTime date;
  DonationStatus status;
  Direction direction;

  Donation({
    this.id,
    this.typeId,
    this.donatorId,
    this.quantity,
    this.unit,
    this.description,
    this.element,
    this.date,
    this.status,
    this.direction,
  });

  Map<String, dynamic> toMap() {
    return {
      'donation_id': id,
      'type_id': typeId,
      'donator_id': donatorId,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'element': element,
      'donation_date': date?.toString(),
      'status': donationStatusToKey(status),
      'direction': direction?.toMap(),
    };


  }
 //el map solo lleva el estado para el UpdateStatus
  Map<String, dynamic> toMap2() {
    return {
      'status': donationStatusToKey(status),
    };
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Donation(
      id: map['donation_id'],
      typeId: map['type_id'],
      donatorId: map['donator_id'],
      quantity: map['quantity'],
      unit: map['unit'],
      description: map['description'],
      element: map['element'],
      date: DateTime.tryParse(map['donation_date']),
      status: keyToDonationStatus(map['status']),
      direction: Direction.fromMap(map['direction']),
    );
  }

  @override
  String toString() {
    return 'Donation(donation_id: $id, typeId: $typeId, donatorId: $donatorId,'
        'quantity: $quantity, unit: $unit, description: $description,'
        'element: $element, date: $date, status: $status, direction: $direction)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Donation &&
        o.id == id &&
        o.typeId == typeId &&
        o.donatorId == donatorId &&
        o.quantity == quantity &&
        o.unit == unit &&
        o.description == description &&
        o.element == element &&
        o.date == date &&
        o.status == status &&
        o.direction == direction;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        typeId.hashCode ^
        donatorId.hashCode ^
        quantity.hashCode ^
        unit.hashCode ^
        description.hashCode ^
        element.hashCode ^
        date.hashCode ^
        status.hashCode ^
        direction.hashCode;
  }

}
