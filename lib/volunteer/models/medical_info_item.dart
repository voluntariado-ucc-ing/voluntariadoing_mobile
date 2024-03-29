import 'package:flutter/foundation.dart';

class MedicalInfoItem {
  int id;
  String title;
  List<String> options;
  MedicalInfoItemType type;
  
  MedicalInfoItem({
    this.id,
    this.title,
    this.options,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'options': options,
      'type': type?.toString()?.split('.')[1],
    };
  }


  factory MedicalInfoItem.fromJson(Map<String, dynamic> parsedJson){

    if (parsedJson == null) return null;

    MedicalInfoItemType _parseType(String type) {
      switch (type) {
        case 'SWITCH':
          return MedicalInfoItemType.SWITCH;
        case 'SELECT':
          return MedicalInfoItemType.SELECT;
        case 'TEXT':
          return MedicalInfoItemType.TEXT;
        default:
          return null;
      }
    }



    final type = _parseType(parsedJson['type']);

    return MedicalInfoItem(
        id: parsedJson['id'],
        title: parsedJson['title'],
        options: parsedJson['options'] != null ? List<String>.from(parsedJson['options']) : null,
        type: type
    );
  }

  factory MedicalInfoItem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    MedicalInfoItemType _parseType(String type) {
      switch (type) {
        case 'SWITCH':
          return MedicalInfoItemType.SWITCH;
        case 'SELECT':
          return MedicalInfoItemType.SELECT;
        case 'TEXT':
          return MedicalInfoItemType.TEXT;
        default:
          return null;
      }
    }



    final type = _parseType(map['type']);
  
    return MedicalInfoItem(
      id: map['id'],
      title: map['title'],
      options: map['options'] != null ? List<String>.from(map['options']) : null,
      type: type
    );
  }

  @override
  String toString() => 
    'MedicalInfoItem(id: $id, title: $title, options: $options, type: $type)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is MedicalInfoItem &&
      o.id == id &&
      o.title == title &&
      listEquals(o.options, options) &&
      o.type == type;
  }

  @override
  int get hashCode => 
    id.hashCode ^ title.hashCode ^ options.hashCode ^ type.hashCode;
}

enum MedicalInfoItemType {
  SWITCH,
  SELECT,
  TEXT
}