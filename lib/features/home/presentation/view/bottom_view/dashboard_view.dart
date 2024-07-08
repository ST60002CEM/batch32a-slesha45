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
  late bool isDark;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(propertyViewModelProvider);

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
          actions: [
            Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                });
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    child:
                        Center(child: Image.asset('assets/images/image.png')),
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
                      width: 200,
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
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Look into ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Estate Ease',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.5,
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

// import 'package:final_assignment/core/common/show_my_snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class DashboardView extends ConsumerStatefulWidget {
//   const DashboardView({super.key});

//   @override
//   ConsumerState<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends ConsumerState<DashboardView> {
//   late bool isDark;
//   @override
//   void initState() {
//     // isDark = ref.read(isDarkThemeProvider);
//     isDark = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Estate Ease'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showMySnackBar(message: 'Refreshing...');
//             },
//             icon: const Icon(
//               Icons.refresh,
//               color: Colors.white,
//             ),
//             // ),
//             // IconButton(
//             //   onPressed: () {
//             //     ref.read(homeViewModelProvider.notifier).logout();
//             //   },
//             //   icon: const Icon(
//             //     Icons.logout,
//             //     color: Colors.white,
//             //   ),
//           ),
//           Switch(
//               value: isDark,
//               onChanged: (value) {
//                 setState(() {
//                   isDark = value;
//                   // ref.read(isDarkThemeProvider.notifier).updateTheme(value);
//                 });
//               }),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               // Image at the top
//               SizedBox(
//                 height: 150,
//                 child: Center(child: Image.asset('assets/images/image.png')),
//               ),
//               const SizedBox(height: 16),
//               // Search bar
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search),
//                   hintText: 'Search Area or Property ID',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Category dropdown
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.brown),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     isExpanded: true,
//                     items: const [
//                       DropdownMenuItem(
//                         value: '1',
//                         child: Text('Apartment'),
//                       ),
//                       DropdownMenuItem(
//                         value: '2',
//                         child: Text('House'),
//                       ),
//                       DropdownMenuItem(
//                         value: '3',
//                         child: Text('Flat'),
//                       ),
//                       DropdownMenuItem(
//                         value: '4',
//                         child: Text('Land'),
//                       ),
//                       DropdownMenuItem(
//                         value: '5',
//                         child: Text('Building'),
//                       ),
//                     ],
//                     onChanged: (value) {},
//                     hint: const Text('Choose a category'),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Look into Estate Ease text
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: RichText(
//                   text: const TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Look into ',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black, // Black color
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'Estate Ease',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.brown, // Brown color
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
