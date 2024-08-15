import 'package:final_assignment/app/contants/api_endpoint.dart';
import 'package:final_assignment/core/common/show_my_snackbar.dart';
import 'package:final_assignment/features/favourite/domain/entity/favourite_entity.dart';
import 'package:final_assignment/features/favourite/presentation/state/favourite_state.dart';
import 'package:final_assignment/features/favourite/presentation/viewmodel/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavouriteView extends ConsumerStatefulWidget {
  const FavouriteView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends ConsumerState<FavouriteView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favouriteViewModelProvider.notifier).fetchFavourite();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(favouriteViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(favouriteViewModelProvider.notifier).fetchFavourite();
        },
        child: _buildBody(state),
      ),
    );
  }

  Widget _buildBody(FavouriteState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${state.error}', textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(favouriteViewModelProvider.notifier).fetchFavourite();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    } else if (state.favourite.isEmpty) {
      return const Center(
        child: Text(
          'No favourite properties',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: state.favourite.length,
        itemBuilder: (context, index) {
          final property = state.favourite[index];
          return _buildPropertyCard(property);
        },
      );
    }
  }

  Widget _buildPropertyCard(FavouriteEntity property) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Slidable(
        key: Key(property.properties.id ??
            ''), // Ensure the key is unique and non-null
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            ref
                .read(favouriteViewModelProvider.notifier)
                .removeFavourite(property.id);
            showMySnackBar(
                message: 'Property removed from favourites', color: Colors.red);
          }),
          children: [
            SlidableAction(
              onPressed: (context) {
                ref
                    .read(favouriteViewModelProvider.notifier)
                    .removeFavourite(property.id);
                showMySnackBar(
                    message: 'Property removed from favourites',
                    color: Colors.red);
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
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                '${ApiEndpoints.imageUrl}${property.properties.propertyImage}',
              ),
            ),
            title: Text(
              property.properties.propertyTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  property.properties.propertyCategory,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to property details page
            },
          ),
        ),
      ),
    );
  }
}
