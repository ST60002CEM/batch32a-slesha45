// import 'package:dartz/dartz.dart';
// import 'package:final_assignment/core/failure/failure.dart';
// import 'package:final_assignment/features/booking/data/repository/booking_remote_repository.dart';
// import 'package:final_assignment/features/booking/domain/entity/booking_entity.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final bookingRepositoryProvider = Provider<IBookingRepository>((ref) => ref.read(bookingRemoteRepository));
 
// abstract class IBookingRepository {
//   Future<Either<Failure, BookingEntity>> createBooking(BookingEntity booking);

//   Future<Either<Failure, List<BookingEntity>>> getUserBookings(int page, int limit);
// }