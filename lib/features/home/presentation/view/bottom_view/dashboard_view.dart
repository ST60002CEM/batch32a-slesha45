import 'package:final_assignment/core/common/show_my_snackbar.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  late bool isDark;
  @override
  void initState() {
    // isDark = ref.read(isDarkThemeProvider);
    isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estate Ease'),
        actions: [
          IconButton(
            onPressed: () {
              showMySnackBar(message: 'Refreshing...');
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).logout();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                  // ref.read(isDarkThemeProvider.notifier).updateTheme(value);
                });
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Look into ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Black color
                      ),
                    ),
                    TextSpan(
                      text: 'Estate Ease',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown, // Brown color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
