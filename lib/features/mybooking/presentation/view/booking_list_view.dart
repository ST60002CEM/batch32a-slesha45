import 'package:final_assignment/features/mybooking/presentation/viewmodel/booking_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
                  ? const Center(child: Text('No bookings available'))
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        final columnWidth = constraints.maxWidth / 4;

                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              border: TableBorder.all(
                                color: Colors.grey.withOpacity(0.3),
                                width: 1.0,
                              ),
                              columnSpacing: 0.0, // Reduced spacing for closer alignment
                              headingRowHeight: 60,
                              dataRowHeight: 56,
                              headingRowColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.brown[200]!),
                              columns: [
                                DataColumn(
                                  label: SizedBox(
                                    width: columnWidth,
                                    child: const Text(
                                      'Property',
                                      style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: columnWidth,
                                    child: const Text(
                                      'Time',
                                      style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: columnWidth,
                                    child: const Text(
                                      'Date',
                                      style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: SizedBox(
                                    width: columnWidth - 10, // Slightly reduce the width
                                    child: const Text(
                                      'Action',
                                      style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                state.bookings.length,
                                (index) {
                                  final booking = state.bookings[index];
                                  final formattedDate = DateFormat('yyyy-MM-dd')
                                      .format(booking.date);
                                  final color = index.isEven
                                      ? Colors.brown[50]
                                      : Colors.white;

                                  return DataRow(
                                    color: MaterialStateColor.resolveWith(
                                        (states) => color!),
                                    cells: [
                                      DataCell(SizedBox(
                                        width: columnWidth,
                                        child: const Text(
                                          'House on sale', // Replace with actual property name if needed
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                      DataCell(SizedBox(
                                        width: columnWidth,
                                        child: Text(
                                          booking.time,
                                          style: TextStyle(
                                            color: Colors.brown[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                      DataCell(SizedBox(
                                        width: columnWidth,
                                        child: Text(
                                          formattedDate,
                                          style: TextStyle(
                                            color: Colors.brown[700],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                                      DataCell(SizedBox(
                                        width: columnWidth - 10, // Adjust width for alignment
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              ref
                                                  .read(
                                                      bookingListViewModelProvider
                                                          .notifier)
                                                  .openKhaltiView();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.brown,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 15, // Reduced padding
                                                vertical: 12,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: const Text('Pay'),
                                          ),
                                        ),
                                      )),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }

  void _handleProceedToPayment(BuildContext context, String bookingId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose a Payment Method'),
        content: const Text('Please select a payment method:'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _updatePaymentMethod(context, bookingId, 'Pay on arrival');
            },
            child: const Text('Pay on Arrival'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _updatePaymentMethod(context, bookingId, 'Khalti Payment');
            },
            child: const Text('Khalti Payment'),
          ),
        ],
      ),
    );
  }

  void _updatePaymentMethod(
      BuildContext context, String bookingId, String paymentMethod) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Method Selected'),
        content: Text('You have selected $paymentMethod.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
