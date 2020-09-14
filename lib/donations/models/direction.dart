import 'dart:convert';

class Direction {
  int id;
  String street;
  int number;
  String details;
  String city;
  int postalCode;
  
  Direction({
    this.id,
    this.street,
    this.number,
    this.details,
    this.city,
    this.postalCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'street': street,
      'number': number,
      'details': details,
      'city': city,
      'postalCode': postalCode,
    };
  }

  factory Direction.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Direction(
      id: map['id'],
      street: map['street'],
      number: map['number'],
      details: map['details'],
      city: map['city'],
      postalCode: map['postalCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Direction.fromJson(String source) => 
    Direction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Direction(id: $id, street: $street, number: $number,'
      'details: $details, city: $city, postalCode: $postalCode)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Direction &&
      o.id == id &&
      o.street == street &&
      o.number == number &&
      o.details == details &&
      o.city == city &&
      o.postalCode == postalCode;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      street.hashCode ^
      number.hashCode ^
      details.hashCode ^
      city.hashCode ^
      postalCode.hashCode;
  }
}