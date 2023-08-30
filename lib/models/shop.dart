import 'package:flutter/widgets.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    Food(
      name: "Tobikko Sushi",
      price: "35.00",
      imagePath: "lib/images/sushi2.png",
      rating: "4.9",
    ),
    // sushi roll
    Food(
      name: "Salmon Sushi",
      price: "25.00",
      imagePath: "lib/images/sushi.png",
      rating: "4.8",
    ),
  ];

  //customer cart
  List<Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove to cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
