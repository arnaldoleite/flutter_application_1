import 'package:flutter/material.dart';
class customProperty {
  final String nameToDisplayKey;
  final bool visible;
  final bool readOnly;
  final int maxLength;
  TextInputType? typeofInput;
  

  customProperty({required  this.nameToDisplayKey, required this.visible, required this.readOnly, required this.maxLength, required this.typeofInput});

  Map<String, dynamic> toMap() {
    return {
      'nameToDisplayKey': nameToDisplayKey,
      'visible': visible,
      'readOnly': readOnly,
      'maxLength': maxLength, 
      'typeofInput': typeofInput.toString(),
    };
  }

  customProperty.fromMap(Map<String, dynamic> customPropertyMap)
      : nameToDisplayKey = customPropertyMap["nameToDisplayKey"],
        visible = customPropertyMap["visible"],
        readOnly = customPropertyMap["readOnly"],
        maxLength = customPropertyMap["maxLength"],
        typeofInput = TextInputType.values.firstWhere((type) => type.toString() == customPropertyMap["typeofInput"]);

}


class Address {
  final String streetName;
  final String zipcode;
  final String cityName;
  final double gpspointlatitude;
  final double gpspointlongitude;
 
  Address(
      {required this.streetName,
      required this.zipcode,
      required this.cityName,
      required this.gpspointlatitude,
      required this.gpspointlongitude});

  factory Address.empty() => Address(
    streetName: '',
    cityName: '',
    zipcode: '',
    gpspointlatitude: 0.0,
    gpspointlongitude: 0.0
  );
  
  static  customProperty getCustomProperty(String propertyName) {
    switch (propertyName) {
      case 'streetName':
        return customProperty(nameToDisplayKey: 'restaurantAddress', visible: true, readOnly: false, maxLength: 50, typeofInput: TextInputType.text);
      case 'zipcode':
        return customProperty(nameToDisplayKey: 'restaurantZipCode', visible: true, readOnly: false, maxLength: 10, typeofInput: TextInputType.text);
      case 'cityName':
        return customProperty(nameToDisplayKey: 'restaurantCityName', visible: true, readOnly: false, maxLength: 50, typeofInput: TextInputType.text);
      case 'gpspointlatitude':
        return customProperty(nameToDisplayKey: 'restaurantGpsPointLatitude', visible: true, readOnly: false, maxLength: 0, typeofInput: TextInputType.number);
      case 'gpspointlongitude':
        return customProperty(nameToDisplayKey: 'restaurantGpsPointLongitude', visible: true, readOnly: false, maxLength: 0, typeofInput: TextInputType.number);
      default:
        return customProperty(nameToDisplayKey: '', visible: false, readOnly: true, maxLength: 0, typeofInput: TextInputType.text);
   }
  }
  Map<String, dynamic> toMap() {
    return {
      'streetName': streetName,
      'zipcode': zipcode,
      'cityName': cityName,
      'gpspointlatitude': gpspointlatitude,
      'gpspointlongitude': gpspointlongitude,
    };
  }
 
 factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      streetName: map['streetName'] ?? '',
      zipcode: map['zipcode'] ?? '',
      cityName: map['cityName'] ?? '',
      gpspointlatitude: (map['gpspointlatitude'] ?? 0).toDouble(),
      gpspointlongitude: (map['gpspointlongitude'] ?? 0).toDouble(),
    );
  }

}
