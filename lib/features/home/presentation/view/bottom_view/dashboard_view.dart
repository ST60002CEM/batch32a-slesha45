import 'package:final_assignment/core/common/provider/theme_view_model_provider.dart';
import 'package:final_assignment/core/common/widgets/my_property_card.dart';
import 'package:final_assignment/features/home/presentation/viewmodel/property_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final ScrollController _scrollController = ScrollController();
  //late bool isDark;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   isDark = false;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(propertyViewModelProvider);
    final isDark = ref.watch(themeViewModelProvider);
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final isTablet = screenWidth > 600;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            _scrollController.position.extentAfter == 0) {
          ref.read(propertyViewModelProvider.notifier).getProperty();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Estate Ease'),
          titleTextStyle: TextStyle(fontSize: isTablet ? 30 : 24),
          actions: [
            IconButton(
              icon: Icon(
                isDark ? Icons.nights_stay : Icons.wb_sunny,
                color: isDark ? Colors.blue : Colors.yellow,
              ),
              onPressed: () {
                ref.read(themeViewModelProvider.notifier).changeTheme();
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await ref.read(propertyViewModelProvider.notifier).resetState();
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 32.0 : 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height:
                        isTablet ? 300 : 150, // Larger image size for tablets
                    child: Center(
                      child: Image.asset(
                        'assets/images/image.png',
                        fit: BoxFit.cover,
                        width: isTablet
                            ? screenWidth * 0.8
                            : screenWidth * 0.9, // Wider image for tablets
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: isTablet ? 250 : 200,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        border: Border.all(color: Colors.brown),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: const [
                            DropdownMenuItem(
                              value: '1',
                              child: Text('Price : High to Low'),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text('Price : Low to High'),
                            ),
                          ],
                          onChanged: (value) {},
                          hint: const Text(
                            'Choose a category',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Look into ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Estate Ease',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.brown[200] : Colors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          isTablet ? 2 : 1, // More columns for tablets
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio:
                          isTablet ? 1.2 : 1.5, // Adjusted aspect ratio
                    ),
                    itemCount: state.property.length,
                    itemBuilder: (context, index) {
                      final property = state.property[index];
                      return MyPropertyCard(property: property);
                    },
                  ),
                  if (state.isLoading)
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
