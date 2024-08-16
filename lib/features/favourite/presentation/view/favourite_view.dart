import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    // Static list of favorite properties
    final favouriteProperties = [
      {
        'id': '1',
        'title': 'House on sale',
        'category': 'House',
        // 'image': 'https://via.placeholder.com/150',
      },
      {
        'id': '2',
        'title': 'Office Building',
        'category': 'Building',
        // 'image': 'https://via.placeholder.com/150',
      },
      {
        'id': '3',
        'title': 'To-let Building',
        'category': 'Building',
        // 'image': 'https://via.placeholder.com/150',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        elevation: 0,
      ),
      body: favouriteProperties.isEmpty
          ? const Center(
              child: Text(
                'No favourite properties',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: favouriteProperties.length,
              itemBuilder: (context, index) {
                final property = favouriteProperties[index];
                return _buildPropertyCard(context, property);
              },
            ),
    );
  }

  Widget _buildPropertyCard(
      BuildContext context, Map<String, String> property) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Slidable(
        key: Key(property['id']!),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            // Handle property removal (static page won't actually remove the item)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Property removed from favourites'),
                backgroundColor: Colors.red,
              ),
            );
          }),
          children: [
            SlidableAction(
              onPressed: (context) {
                // Handle property removal (static page won't actually remove the item)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Property removed from favourites'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Remove',
            ),
          ],
        ),
        child: Card(
          elevation: 2,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            // leading: CircleAvatar(
            //   radius: 30,
            //   backgroundImage: NetworkImage(property['image']!),
            // ),
            title: Text(
              property['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  property['category']!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            trailing:
                const Icon(Icons.delete_outline_outlined, color: Colors.red),
            onTap: () {
              // Static page won't navigate anywhere
            },
          ),
        ),
      ),
    );
  }
}
