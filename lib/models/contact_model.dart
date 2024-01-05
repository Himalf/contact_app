import 'dart:io';
import 'package:contact/models/lat_lng_model.dart';
import 'package:hive/hive.dart';
// part 'contact_model.g.dart';

@HiveType(typeId: 1)
class ContactModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  File? image;
  @HiveField(3)
  LatLngModel position;
  ContactModel(
      {required this.name,
      required this.phoneNumber,
      required this.image,
      required this.position});
}
