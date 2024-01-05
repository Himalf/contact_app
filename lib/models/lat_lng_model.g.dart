// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'lat_lng_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class LatLngModelAdapter extends TypeAdapter<LatLngModel> {
//   @override
//   final int typeId = 1;

//   @override
//   LatLngModel read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return LatLngModel(
//       latitude: fields[0] as double,
//       longitude: fields[1] as double,
//       address: fields[2] as String?,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, LatLngModel obj) {
//     writer
//       ..writeByte(3)
//       ..writeByte(0)
//       ..write(obj.latitude)
//       ..writeByte(1)
//       ..write(obj.longitude)
//       ..writeByte(2)
//       ..write(obj.address);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is LatLngModelAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
