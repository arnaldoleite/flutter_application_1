
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dailyfood.dart';
import 'base.dart';
class Restaurant {
  final String id;
  final String creatorId;
  final DateTime postedAt;
  final String name;
  final String fullname;
  final Address address;
  final DailyFood dailyfood;
  final String cellnumber;

  final String logoimageurl;
  final String backgroundimageurl;
  final bool makereservation;
  final bool closed;
  final String closedmessage;
  
  Restaurant(
    {required this.id,
    required this.creatorId,
    required this.postedAt,
    required this.name,
    required this.fullname,
    this.cellnumber='',
    required this.address,
    required this.dailyfood,

    this.logoimageurl='',
    this.backgroundimageurl='',
    this.makereservation=false,
    this.closed=false,
    this.closedmessage='',});

    static customProperty getCustomProperty(String propertyName) {
    switch (propertyName) {
      case 'creatorId':
        return customProperty(nameToDisplay: 'Creator Identification', visible: false, readOnly: true, maxLength: 0, typeofInput: TextInputType.text);
      case 'postedAt':
        return customProperty(nameToDisplay: 'Posted At', visible: false, readOnly: true, maxLength: 0, typeofInput: TextInputType.datetime);
      case 'name':
        return customProperty(nameToDisplay: 'Name', visible: true, readOnly: false, maxLength: 20, typeofInput: TextInputType.name);
      case 'fullname':
        return customProperty(nameToDisplay: 'Full Name', visible: true, readOnly: false, maxLength: 40, typeofInput: TextInputType.name);
      case 'cellnumber':
        return customProperty(nameToDisplay: 'Cell Number', visible: true, readOnly: false, maxLength: 10, typeofInput: TextInputType.phone);
      case 'logoimageurl':
        return customProperty(nameToDisplay: 'Logo Image URL', visible: true, readOnly: false, maxLength: 999, typeofInput: TextInputType.url);
      case 'backgroundimageurl':
        return customProperty(nameToDisplay: 'Background Image URL', visible: true, readOnly: false, maxLength: 99, typeofInput: TextInputType.url);
      case 'makereservation':
        return customProperty(nameToDisplay: 'Make Reservation', visible: true, readOnly: false, maxLength: 0, typeofInput: TextInputType.text);
      case 'closed':
        return customProperty(nameToDisplay: 'Closed', visible: true, readOnly: false, maxLength: 0, typeofInput: TextInputType.text);
      case 'closedmessage':
        return customProperty(nameToDisplay: 'Closed Message', visible: true, readOnly: false, maxLength: 200, typeofInput: TextInputType.multiline);
      case 'address':
        return customProperty(nameToDisplay: 'Address', visible: true, readOnly: false, maxLength: 200, typeofInput: TextInputType.multiline);
      case 'dailyfood':
        return customProperty(nameToDisplay: 'Daily Food', visible: true, readOnly: false, maxLength: 200, typeofInput: TextInputType.multiline);
      default:
        customProperty customPrty = DailyFood.getCustomProperty(propertyName);
        if (customPrty.nameToDisplay == '') {
          customPrty = Address.getCustomProperty(propertyName);
        }
        if (customPrty.nameToDisplay == '') {
          
          return customProperty(nameToDisplay: 'Invalid property name: $propertyName', visible: true, readOnly: false, maxLength: 200, typeofInput: TextInputType.multiline);
     
        } else {
          return customPrty;
        }
    }
  } 


  Map<String, dynamic> toMap() { //<nome da proriedade>_<RW ou RO>
    return {
      'creatorId': creatorId,
      'postedAt': postedAt,
      'name': name,
      'fullname': fullname,
      'cellnumber': cellnumber,
      'logoimageurl': logoimageurl,
      'backgroundimageurl': backgroundimageurl,
      'makereservation': makereservation,
      'closed': closed,
      'closedmessage': closedmessage,
      'address': address.toMap(),
      'dailyfood': dailyfood.toMap()
    };
  }
  Restaurant.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        creatorId = doc.data()!["creatorId"],
        postedAt = doc.data()!["postedAt"].toDate(),
        name = doc.data()!["name"],
        fullname = doc.data()!["fullname"],
        cellnumber = doc.data()!["cellnumber"], 
        logoimageurl = doc.data()!["logoimageurl"],
        backgroundimageurl = doc.data()!["backgroundimageurl"],
        makereservation = doc.data()!["makereservation"],
        closed = doc.data()!["closed"],
        closedmessage = doc.data()!["closedmessage"],
        address = Address.fromMap(Map<String, dynamic>.from(doc.data()!["address"])),
        dailyfood = DailyFood.fromMap(Map<String, dynamic>.from(doc.data()!["dailyfood"]));
}