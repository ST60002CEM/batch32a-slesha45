import 'package:final_assignment/core/common/show_my_snackbar.dart';
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
            // ),
            // IconButton(
            //   onPressed: () {
            //     ref.read(homeViewModelProvider.notifier).logout();
            //   },
            //   icon: const Icon(
            //     Icons.logout,
            //     color: Colors.white,
            //   ),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Image at the top
              SizedBox(
                height: 150,
                child: Center(child: Image.asset('assets/images/image.png')),
              ),
              const SizedBox(height: 16),
              // Search bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Area or Property ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Category dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: '1',
                        child: Text('Apartment'),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text('House'),
                      ),
                      DropdownMenuItem(
                        value: '3',
                        child: Text('Flat'),
                      ),
                      DropdownMenuItem(
                        value: '4',
                        child: Text('Land'),
                      ),
                      DropdownMenuItem(
                        value: '5',
                        child: Text('Building'),
                      ),
                    ],
                    onChanged: (value) {},
                    hint: const Text('Choose a category'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Look into Estate Ease text
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
      ),
    );
  }
}
