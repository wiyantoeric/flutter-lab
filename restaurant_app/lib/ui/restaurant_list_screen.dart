import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant.dart';
import 'package:restaurant_app/ui/restaurant_details_screen.dart';
import 'package:restaurant_app/widgets/restaurant_card.dart';

class RestaurantListScreen extends StatelessWidget {
  static const routeName = "/retaurant";
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString("assets/local_restaurant.json"),
          builder: (context, snapshot) {
            return (snapshot.hasData)
                ? SliverRestaurantList(
                    restaurants: parseRestaurants(snapshot.data))
                : Center(
                    child: Text(
                    "Loading the data",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ));
          }),
    );
  }
}

class SliverRestaurantList extends StatelessWidget {
  SliverRestaurantList({required this.restaurants, super.key});

  List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            expandedHeight: 140,
            collapsedHeight: 80,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  Text(
                    "Restaurant App",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Text("Makan apa hari ini?"),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(restaurants
                .map((e) => Hero(
                    tag: e.id,
                    child: RestaurantCard(
                      restaurant: e,
                      onTap: () => Navigator.of(context).pushNamed(
                          RestaurantDetailsScreen.routeName,
                          arguments: e),
                    )))
                .toList()),
          ),
        ],
      ),
    );
  }
}
