import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/model/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurantData in restaurantsData) {
      //depois do in é uma lista que esta sendo inteirada e var é o elemento a cada interação, que vai ser sempre um map (restaurante)
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      listRestaurant.add(restaurant); //adiciona na lista vazia
    }
  }
}
