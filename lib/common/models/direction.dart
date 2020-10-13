class Direction {
  final String street;
  final int number;
  final String details;
  final String city;
  final int postalCode;

  Direction({
    this.street,
    this.number,
    this.details,
    this.city,
    this.postalCode,
  });

  Direction copyWith({
    String street,
    int number,
    String details,
    String city,
    int postalCode,
  }) {
    return Direction(
      street: street ?? this.street,
      number: number ?? this.number,
      details: details ?? this.details,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (street != null) 'street': street,
      if (number != null) 'number': number,
      if (details != null) 'details': details,
      if (city != null) 'city': city,
      if (postalCode != null) 'postal_code': postalCode,
    };
  }

  factory Direction.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Direction(
      street: map['street'],
      number: map['number'],
      details: map['details'],
      city: map['city'],
      postalCode: map['postal_code'],
    );
  }

  @override
  String toString() {
    return 'Direction(street: $street, number: $number, details: '
        '$details, city: $city, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Direction &&
        o.street == street &&
        o.number == number &&
        o.details == details &&
        o.city == city &&
        o.postalCode == postalCode;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        number.hashCode ^
        details.hashCode ^
        city.hashCode ^
        postalCode.hashCode;
  }
}
