import 'package:voluntariadoing_mobile/common/models/direction.dart';

class Volunteer {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final int documentId;
  final String password;
  final VolunteerDetails details;

  Volunteer({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.documentId,
    this.password,
    this.details,
  });

  Volunteer copyWith({
    int id,
    String firstName,
    String lastName,
    String username,
    int documentId,
    String password,
    VolunteerDetails details,
  }) {
    return Volunteer(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      documentId: documentId ?? this.documentId,
      password: password ?? this.password,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'volunteer_id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (username != null) 'username': username,
      if (documentId != null) 'document_id': documentId,
      if (password != null) 'password' : password,
      if (details != null) 'details': details?.toMap(),
    };
  }
  Map<String, dynamic> toMap2() {
    return {
      if (id != null) 'volunteer_id': id,
      if (username != null) 'username': username,
      if (password != null) 'password' : password,
    };
  }
  factory Volunteer.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Volunteer(
      id: map['volunteer_id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      username: map['username'],
      documentId: map['document_id'],
      password: map ['password'],
      details: VolunteerDetails.fromMap(map['details']),
    );
  }

  @override
  String toString() {
    return 'Volunteer(id: $id, firstName: $firstName, lastName: $lastName,'
        ' username: $username, documentId: $documentId, password: $password details: $details)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Volunteer &&
        o.id == id &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.username == username &&
        o.documentId == documentId &&
        o.password == password &&
        o.details == details;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    firstName.hashCode ^
    lastName.hashCode ^
    username.hashCode ^
    documentId.hashCode ^
    password.hashCode ^
    details.hashCode;
  }
}

class VolunteerDetails {
  final String contactEmail;
  final String phoneNumber;
  final String photoUrl;
  final DateTime birthDate;
  final bool hasCar;
  final String university;
  final String career;
  final int careerYear;
  final String careerCondition;
  final int works;
  final Direction direction;
  VolunteerDetails({
    this.contactEmail,
    this.phoneNumber,
    this.photoUrl,
    this.birthDate,
    this.hasCar,
    this.university,
    this.career,
    this.careerYear,
    this.careerCondition,
    this.works,
    this.direction,
  });

  VolunteerDetails copyWith({
    String contactEmail,
    String phoneNumber,
    String photoUrl,
    DateTime birthDate,
    bool hasCar,
    String university,
    String career,
    int careerYear,
    String careerCondition,
    int works,
    Direction direction,
  }) {
    return VolunteerDetails(
      contactEmail: contactEmail ?? this.contactEmail,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoUrl: photoUrl ?? this.photoUrl,
      birthDate: birthDate ?? this.birthDate,
      hasCar: hasCar ?? this.hasCar,
      university: university ?? this.university,
      career: career ?? this.career,
      careerYear: careerYear ?? this.careerYear,
      careerCondition: careerCondition ?? this.careerCondition,
      works: works ?? this.works,
      direction: direction ?? this.direction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (contactEmail != null) 'contact_email': contactEmail,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (birthDate != null) 'birth_date': birthDate.toIso8601String(),
      if (hasCar != null) 'has_car': hasCar,
      if (university != null) 'university': university,
      if (career != null) 'career': career,
      if (careerYear != null) 'career_year': careerYear,
      if (careerCondition != null) 'career_condition': careerCondition,
      if (works != null) 'works': works,
      if (direction != null) 'direction': direction?.toMap(),
    };
  }

  factory VolunteerDetails.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return VolunteerDetails(
      contactEmail: map['contact_email'],
      phoneNumber: map['phone_number'],
      photoUrl: map['photo_url'],
      birthDate: DateTime.tryParse(map['birth_date']),
      hasCar: map['has_car'],
      university: map['university'],
      career: map['career'],
      careerYear: map['career_year'],
      careerCondition: map['career_condition'],
      works: map['works'],
      direction: Direction.fromMap(map['direction']),
    );
  }

  @override
  String toString() {
    return 'VolunteerDetails(contactEmail: $contactEmail, phoneNumber: $phoneNumber,'
        ' photoUrl: $photoUrl, birthDate: $birthDate, hasCar: $hasCar, university: $university,'
        ' career: $career, careerYear: $careerYear, careerCondition: $careerCondition,'
        ' works: $works, direction: $direction)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VolunteerDetails &&
        o.contactEmail == contactEmail &&
        o.phoneNumber == phoneNumber &&
        o.photoUrl == photoUrl &&
        o.birthDate == birthDate &&
        o.hasCar == hasCar &&
        o.university == university &&
        o.career == career &&
        o.careerYear == careerYear &&
        o.careerCondition == careerCondition &&
        o.works == works &&
        o.direction == direction;
  }

  @override
  int get hashCode {
    return contactEmail.hashCode ^
    phoneNumber.hashCode ^
    photoUrl.hashCode ^
    birthDate.hashCode ^
    hasCar.hashCode ^
    university.hashCode ^
    career.hashCode ^
    careerYear.hashCode ^
    careerCondition.hashCode ^
    works.hashCode ^
    direction.hashCode;
  }
}