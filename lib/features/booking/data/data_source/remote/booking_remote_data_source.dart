// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:final_assignment/app/contants/api_endpoint.dart';
// import 'package:final_assignment/core/failure/failure.dart';
// import 'package:final_assignment/core/networking/remote/http_service.dart';
// import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
// import 'package:final_assignment/features/booking/data/model/booking_api_model.dart';
// import 'package:final_assignment/features/booking/domain/entity/booking_entity.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
 
// final bookingRemoteDataSourceProvider = Provider<BookingRemoteDataSource>((ref) {
//   final dio = ref.watch(httpServiceProvider);
//   final bookingApiModel = ref.watch(bookingApiModelProvider);
//   final userSharedPrefs = ref.watch(userSharedPrefsProvider);
//   return BookingRemoteDataSource(
//     dio: dio,
//     bookingApiModel: bookingApiModel,
//     userSharedPrefs: userSharedPrefs,
//   );
// });
 
// class BookingRemoteDataSource {
//   final Dio dio;
//   final BookingApiModel bookingApiModel;
//   final UserSharedPrefs userSharedPrefs;
 
//   BookingRemoteDataSource({
//     required this.dio,
//     required this.bookingApiModel,
//     required this.userSharedPrefs,
//   });
 
//   Future<Either<Failure, BookingEntity>> createBooking(BookingEntity booking) async {
//     try {
//       final token = await userSharedPrefs.getUserToken();
//       token.fold((l) => throw Failure(error: l.error), (r) => r);
 
//       final response = await dio.post(
//         ApiEndpoints.baseUrl + ApiEndpoints.createBooking,
//         data: bookingApiModel.fromEntity(booking).toJson(),
//         options: Options(
//           headers: {
//             'authorization': 'Bearer $token',
//           },
//         ),
//       );
 
//       if (response.statusCode == 201) {
//         return Right(bookingApiModel.fromJson(response.data).toEntity());
//       }
//       return Left(Failure(error: response.data['message']));
//     } on DioException catch (e) {
//       return Left(Failure(error: e.error.toString()));
//     }
//   }
 
//   Future<Either<Failure, List<BookingEntity>>> getUserBookings(int page, int limit) async {
//     try {
//       final token = await userSharedPrefs.getUserToken();
//       token.fold((l) => throw Failure(error: l.error), (r) => r);
 
//       final response = await dio.get(
//         ApiEndpoints.baseUrl + ApiEndpoints.getUserBookings,
//         options: Options(
//           headers: {
//             'authorization': 'Bearer $token',
//           },
//         ),
//       );
 
//       if (response.statusCode == 200) {
//         final bookings = (response.data as List)
//             .map((booking) => bookingApiModel.fromJson(booking).toEntity())
//             .toList();
//         return Right(bookings);
//       }
//       return Left(Failure(error: response.data['message']));
//     } on DioException catch (e) {
//       return Left(Failure(error: e.error.toString()));
//     }
//   }
 
//   // Implement other methods for updating booking status, updating payment method, etc.
// }