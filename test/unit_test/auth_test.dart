import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:final_assignment/features/auth/domain/usecases/auth_usecase.dart';
import 'package:final_assignment/features/auth/presentation/navigator/login_navigator.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

// Generate mocks for the necessary classes
@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;

  setUp(() {
    mockAuthUsecase = MockAuthUseCase();
    mockLoginViewNavigator = MockLoginViewNavigator();
    container = ProviderContainer(
      overrides: [
        authViewModelProvider.overrideWith(
          (ref) => AuthViewModel(mockLoginViewNavigator, mockAuthUsecase),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test("Login with valid credentials", () async {
    // Arrange
    const correctEmail = 'slesha@gmail.com';
    const correctPassword = 'slesha123';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) async {
      final email = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return email == correctEmail && password == correctPassword
          ? const Right(true)
          : Left(Failure(error: 'Invalid'));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser(correctEmail, correctPassword);

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
    expect(authState.isLoading, false);
  });

  test("Register user with valid credentials", () async {
    // Arrange
    const validUser = AuthEntity(
      fName: 'slesha',
      lName: 'slesha',
      email: 'slesha@gmail.com',
      phone: 1234567890,
      password: 'slesha123',
    );

    when(mockAuthUsecase.registerUser(any)).thenAnswer((invocation) async {
      final user = invocation.positionalArguments[0] as AuthEntity;
      return user.fName.isNotEmpty &&
              user.lName.isNotEmpty &&
              user.email.isNotEmpty &&
              user.password.isNotEmpty &&
              user.email.contains('@') &&
              user.email.contains('.') &&
              user.phone.toString().length == 10
          ? const Right(true)
          : Left(Failure(error: 'Invalid'));
    });

    // Act
    await container.read(authViewModelProvider.notifier).registerUser(validUser);

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
    expect(authState.isLoading, false);
  });
}
