// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBookingDto _$GetBookingDtoFromJson(Map<String, dynamic> json) =>
    GetBookingDto(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => BookingApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBookingDtoToJson(GetBookingDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
