import 'package:json_annotation/json_annotation.dart';

part 'medical_info_item.g.dart';

@JsonSerializable()
class MedicalInfoItem {
  
  final int id;
  final String title;
  final List<String> options;
  final String type;
  
  MedicalInfoItemType get infoType {
    if (type == 'SWITCH') {
      return MedicalInfoSwitchItem();
    }
    else if (type == 'SELECT') {
      return MedicalInfoSelectItem();
    }
    else if (type == 'TEXT') {
      return MedicalInfoTextItem();
    }
    return MedicalInfoDefaultItem();
  }

  MedicalInfoItem({
    this.id,
    this.title,
    this.type,
    this.options
  });

  factory MedicalInfoItem.fromJson(Map<String, dynamic> json) => 
    _$MedicalInfoItemFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalInfoItemToJson(this);

}

abstract class MedicalInfoItemType {
  final String name;

  MedicalInfoItemType(this.name);
}

class MedicalInfoDefaultItem extends MedicalInfoItemType {
  
  MedicalInfoDefaultItem() : super('DEFAULT');
}

class MedicalInfoSwitchItem extends MedicalInfoItemType {
  
  MedicalInfoSwitchItem() : super('SWITCH');
}

class MedicalInfoSelectItem extends MedicalInfoItemType {
  
  MedicalInfoSelectItem() : super('SELECT');
}

class MedicalInfoTextItem extends MedicalInfoItemType {
  
  MedicalInfoTextItem() : super('TEXT');
}