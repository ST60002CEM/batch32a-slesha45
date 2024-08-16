import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/booking/domain/entity/booking_entity.dart';
import 'package:final_assignment/features/booking/domain/usecases/booking_usecase.dart';
import 'package:final_assignment/features/booking/presentation/state/booking_state.dart';
import 'package:final_assignment/features/booking/presentation/viewmodel/booking_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
@GenerateNiceMocks([MockSpec<BookingUsecase>()])
import 'booking_test.mocks.dart';

// Mock showMySnackBar

void main() {
  late MockBookingUsecase mockBookingUsecase;
  late ProviderContainer container;

  setUp(() {
    mockBookingUsecase = MockBookingUsecase();
    container = ProviderContainer(
      overrides: [
        bookingViewmodelProvider.overrideWith((ref) =>
            BookingViewmodel(bookingUsecase: mockBookingUsecase)),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test("Initial State", () {
    final state = container.read(bookingViewmodelProvider);
    expect(state.isLoading, false);
    expect(state.error, isNull);
    
  });

}
