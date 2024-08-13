import 'package:final_assignment/app/navigator/navigator.dart';
import 'package:final_assignment/features/mybooking/presentation/view/booking_list_view.dart';

class BookingListViewNavigator {}

mixin BookingListViewNavigatorRoute {
  void openBookingDetail() {
    NavigateRoute.pushRoute(const BookingListView());
  }
}
