// import 'package:equatable/equatable.dart';
// import 'package:final_assignment/features/booking/domain/entity/booking_entity.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:json_annotation/json_annotation.dart';
 
// part 'booking_api_model.g.dart';
 
// final bookingApiModelProvider = Provider<BookingApiModel>((ref) => BookingApiModel.empty());
 
// @JsonSerializable()
// class BookingApiModel extends Equatable {
//   @JsonKey(name: '_id')
//   final String? id;
//   final String userId;
//   final String propertyId;
//   final DateTime date;
//   final String time;
//   final String status;
//   final String paymentMethod;
 
//   const BookingApiModel({
//     required this.id,
//     required this.userId,
//     required this.propertyId,
//     required this.date,
//     required this.time,
//     this.status = 'pending',
//     this.paymentMethod = 'Pay on arrival',
//   });

//    BookingApiModel.empty()
//       : id = '',
//       userId = '',
//       propertyId = '',
//       date = DateTime.now(),
//       time = '',
//       status = 'pending',
//       paymentMethod = 'Pay on arrival';
 
//   factory BookingApiModel.fromJson(Map<String, dynamic> json) => _$BookingApiModelFromJson(json);
 
//   Map<String, dynamic> toJson() => _$BookingApiModelToJson(this);
 
//   // Convert API model to Entity
//   BookingEntity toEntity() {
//     return BookingEntity(
//       userId: userId,
//       propertyId: propertyId,
//       date: date,
//       time: time,
//       status: status,
//       paymentMethod: paymentMethod,
//     );
//   }
 
//   // Convert Entity to API model
//   factory BookingApiModel.fromEntity(BookingEntity entity) {
//     return BookingApiModel(
//       id: entity.id,
//       userId: entity.userId,
//       propertyId: entity.propertyId,
//       date: entity.date,
//       time: entity.time,
//       status: entity.status,
//       paymentMethod: entity.paymentMethod,
//     );
//   }

//   List<BookingEntity> toEntityList(List<BookingApiModel> bookings){
//     return bookings.map((booking) => booking.toEntity()).toList();
//   }

//   List<BookingApiModel> fromEntityList(List<BookingEntity> bookings){
//     return bookings.map((booking) => BookingApiModel.fromEntity(booking)).toList();
//   }
 
//   @override
//   List<Object?> get props => [id, userId, propertyId, date, time, status, paymentMethod];
// }