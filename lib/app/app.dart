import 'package:final_assignment/app/navigator_key/navigator_key.dart';
import 'package:final_assignment/app/themes/app_theme.dart';
import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
import 'package:final_assignment/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeViewModelProvider);

    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      theme: AppTheme.getApplicationTheme(themeState),
      home: const LoginView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
