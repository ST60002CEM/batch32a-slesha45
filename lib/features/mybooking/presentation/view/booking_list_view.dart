import 'package:final_assignment/features/mybooking/presentation/viewmodel/booking_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingListView extends ConsumerWidget {
  const BookingListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Booking List'),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text('Error: ${state.error}'))
              : state.bookings.isEmpty
                  ? const Center(child: Text('No booking available'))
                  :  const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      
                    )
    );
    
  }
}
