import 'package:flutter/material.dart';
import 'base.dart';
class DailyFood  {
  final String dailyfood1name;
  final String dailyfood1image;
  final double dailyfood1price;
  final bool dailyfood1active;
  final String dailyfood2name;
  final String dailyfood2image;
  final double dailyfood2price;
  final bool dailyfood2active;
  final String dailyfood3name;
  final String dailyfood3image;
  final double dailyfood3price;
  final bool dailyfood3active;

  DailyFood(
      {required this.dailyfood1name,
      required this.dailyfood1image,
      required this.dailyfood1price,
      required this.dailyfood1active,
      required this.dailyfood2name,
      required this.dailyfood2image,
      required this.dailyfood2price,
      required this.dailyfood2active,
      required this.dailyfood3name,
      required this.dailyfood3image,
      required this.dailyfood3price,
      required this.dailyfood3active});
  
    factory DailyFood.empty() => DailyFood(
      dailyfood1name: '',
      dailyfood1image: '',
      dailyfood1price: 0,
      dailyfood1active: false,
      dailyfood2name: '',
      dailyfood2image: '',
      dailyfood2price: 0,
      dailyfood2active: false,
      dailyfood3name: '',
      dailyfood3image: '',
      dailyfood3price: 0,
      dailyfood3active: false,
    );

  static  customProperty getCustomProperty(String propertyName) {
    switch (propertyName) {
      case 'dailyfood1name':
        return customProperty(nameToDisplay: 'Dish of the day one', visible: true, readOnly: false, maxLength: 50, typeofInput: TextInputType.text);
      case 'dailyfood1image':
        return customProperty(nameToDisplay: 'Dish of the day one Image URL', visible: true, readOnly: false, maxLength: 200, typeofInput: TextInputType.url);
      case 'dailyfood1price':
        return customProperty(nameToDisplay: 'Dish of the day one Price', visible: true, readOnly: false, maxLength: 10, typeofInput: TextInputType.number);
      case 'dailyfood1active':
        return customProperty(nameToDisplay: 'Dish of the day one Active', visible: true, readOnly: false, maxLength: 5, typeofInput: TextInputType.text);
      case 'dailyfood2name':
        return customProperty(nameToDisplay: 'Dish of the day two', visible: true, readOnly: false, maxLength: 50, typeofInput: TextInputType.text);
      case 'dailyfood2image':
        return customProperty(nameToDisplay: 'Dish of the day two Image URL', visible: true, readOnly: false, maxLength: 200, typeofInput: TextInputType.url);
      case 'dailyfood2price':
        return customProperty(nameToDisplay: 'Dish of the day two Price', visible: true, readOnly: false, maxLength: 10, typeofInput: TextInputType.number);
      case 'dailyfood2active':
        return customProperty(nameToDisplay: 'Dish of the day two Active', visible: true, readOnly: false, maxLength: 5, typeofInput: TextInputType.text);
      case 'dailyfood3name':
        return customProperty(nameToDisplay: 'Dish of the day three', visible: true, readOnly: false, maxLength: 50, typeofInput: TextInputType.text);
      case 'dailyfood3image':
        return customProperty(nameToDisplay: 'Dish of the day three Image URL', visible: true, readOnly: false, maxLength: 200, typeofInput: TextInputType.url);
      case 'dailyfood3price':
        return customProperty(nameToDisplay: 'Dish of the day three Price', visible: true, readOnly: false, maxLength: 10, typeofInput: TextInputType.number);
      case 'dailyfood3active':
        return customProperty(nameToDisplay: 'Dish of the day three Active', visible: true, readOnly: false, maxLength: 5, typeofInput: TextInputType.text);
      default:
        return customProperty(nameToDisplay: '', visible: false, readOnly: true, maxLength: 0, typeofInput: TextInputType.text);
    }
  } 
  
  Map<String, dynamic> toMap() {
    return {
      'dailyfood1name': dailyfood1name,
      'dailyfood1image': dailyfood1image,
      'dailyfood1price': dailyfood1price,
      'dailyfood1active': dailyfood1active,
      'dailyfood2name': dailyfood2name,
      'dailyfood2image': dailyfood2image,
      'dailyfood2price': dailyfood2price,
      'dailyfood2active': dailyfood2active,
      'dailyfood3name': dailyfood3name,
      'dailyfood3image': dailyfood3image,
      'dailyfood3price': dailyfood3price,
      'dailyfood3active': dailyfood3active,
    };
  }
  factory DailyFood.fromMap(Map<String, dynamic> dailyfoodMap)  {
      return DailyFood(
        dailyfood1name : dailyfoodMap["dailyfood1name"] ?? '',
        dailyfood1image : dailyfoodMap["dailyfood1image"] ?? '',
        dailyfood1price : (dailyfoodMap["dailyfood1price"] ?? 0).toDouble(),
        dailyfood1active : dailyfoodMap["dailyfood1active"],
        dailyfood2name : dailyfoodMap["dailyfood2name"] ?? '',
        dailyfood2image : dailyfoodMap["dailyfood2image"] ?? '',
        dailyfood2price : (dailyfoodMap["dailyfood2price"] ?? 0).toDouble(),
        dailyfood2active : dailyfoodMap["dailyfood2active"],
        dailyfood3name : dailyfoodMap["dailyfood3name"] ?? '',
        dailyfood3image : dailyfoodMap["dailyfood3image"] ?? '',
        dailyfood3price : (dailyfoodMap["dailyfood3price"] ?? 0).toDouble(),
        dailyfood3active : dailyfoodMap["dailyfood3active"],
        );
  }
}

