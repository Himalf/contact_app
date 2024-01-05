import 'package:hive/hive.dart';
// part 'lat_lng_model.g.dart';

@HiveType(typeId: 1)
class LatLngModel {
  @HiveField(0)
  double latitude;
  @HiveField(1)
  double longitude;
  @HiveField(2)
  String? address;
  LatLngModel({required this.latitude, required this.longitude, this.address});
}
