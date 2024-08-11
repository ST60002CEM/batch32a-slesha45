// import 'package:final_assignment/features/booking/domain/usecases/booking_usecase.dart';
// import 'package:final_assignment/features/booking/presentation/state/booking_state.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
 
// final bookingViewModelProvider =
//     StateNotifierProvider<BookingViewModel, BookingState>(
//         (ref) => BookingViewModel(
//               bookingUseCase: ref.watch(bookingUsecaseProvider),
//             ));
 
// class BookingViewModel extends StateNotifier<BookingState> {
//   BookingViewModel({required this.bookingUseCase})
//       : super(BookingState.initial()) {
//     getBookings();
//   }
 
//   final BookingUseCase bookingUseCase;
 
//   Future<void> getBookings() async {
//     state = state.copyWith(isLoading: true);
//     final currentState = state;
//     final page = currentState.page + 1;
//     final bookings = currentState.bookings;
//     final hasReachedMax = currentState.hasReachedMax;
 
//     if (!hasReachedMax) {
//       // Call the use case to fetch bookings
//       final result = await bookingUseCase.getBookings(page, 6);
     
//       // Handle success or failure
//       result.fold(
//         (failure) {
//           state = state.copyWith(hasReachedMax: true, isLoading: false);
//         },
//         (data) {
//           if (data.isEmpty) {
//             state = state.copyWith(hasReachedMax: true);
//           } else {
//             state = state.copyWith(
//               bookings: [...bookings, ...data],
//               page: page,
//               isLoading: false,
//             );
//           }
//         },
//       );
//     }
//   }
// }