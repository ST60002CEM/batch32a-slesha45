import 'package:final_assignment/app/contants/api_endpoint.dart';
import 'package:final_assignment/core/common/show_my_snackbar.dart';
import 'package:final_assignment/features/favourite/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteView extends ConsumerWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProperties = ref.watch(favoritePropertiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My wishlists'),
      ),
      body: ListView.builder(
        itemCount: favoriteProperties.length,
        itemBuilder: (context, index) {
          final property = favoriteProperties[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      '${ApiEndpoints.imageUrl}${property.propertyImage}',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.propertyTitle,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          property.propertyLocation,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Rs ${property.propertyPrice}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_sharp,
                        color: Colors.red),
                    onPressed: () {
                      ref
                          .read(favoritePropertiesProvider.notifier)
                          .removeProperty(property);
                      showMySnackBar(
                          message:
                              "${property.propertyTitle} removed from favourites");
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
