import 'package:flutter/material.dart';
class customProperty {
  final String nameToDisplay;
  final bool visible;
  final bool readOnly;
  final int maxLength;
  TextInputType? typeofInput;

  customProperty({ required  this.nameToDisplay, required this.visible, required this.readOnly, required this.maxLength, required this.typeofInput});

  Map<String, dynamic> toMap() {
    return {
      'name': nameToDisplay,
      'visible': visible,
      'readOnly': readOnly,
      'maxLength': maxLength, 
      'typeofInput': typeofInput.toString(),
    };
  }

  customProperty.fromMap(Map<String, dynamic> customPropertyMap)
      : nameToDisplay = customPropertyMap["name"],
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
        return customProperty(nameToDisplay: 'Street Name', visible: true, readOnly: false, maxLength: 50, typeofInput: TextInputType.text);
      case 'zipcode':
        return customProperty(nameToDisplay: 'Zip Code', visible: true, readOnly: false, maxLength: 10, typeofInput: TextInputType.text);
      case 'cityName':
        return customProperty(nameToDisplay: 'City Name', visible: true, readOnly: false, maxLength: 50, typeofInput: TextInputType.text);
      case 'gpspointlatitude':
        return customProperty(nameToDisplay: 'GPS Point Latitude', visible: true, readOnly: false, maxLength: 0, typeofInput: TextInputType.number);
      case 'gpspointlongitude':
        return customProperty(nameToDisplay: 'GPS Point Longitude', visible: true, readOnly: false, maxLength: 0, typeofInput: TextInputType.number);
      default:
        return customProperty(nameToDisplay: '', visible: false, readOnly: true, maxLength: 0, typeofInput: TextInputType.text);
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
