import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/widgets/menu_list.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const routeName = "/restaurant/details";

  final Restaurant restaurant;

  const RestaurantDetailsScreen({required this.restaurant, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          restaurant.name,
          overflow: TextOverflow.fade,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: restaurant.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Image(image: NetworkImage(restaurant.pictureId)),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 18,
                          ),
                          Text(
                            restaurant.city,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(restaurant.description),
                      const SizedBox(height: 12),
                      MenuList(items: restaurant.foods, label: "Foods"),
                      const SizedBox(height: 12),
                      MenuList(items: restaurant.drinks, label: "Drinks"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
