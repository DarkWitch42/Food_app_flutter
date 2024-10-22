import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:test001/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [
    //rice plate
    Food(name: "Fish Thali",
        description: "This thali contains tawa kolambi fry, bangda curry, tandalachi bhakari, pomfret fry, solkadhi and rice. ",
        imagePath: "lib/images/riceplate/rice1.jpeg",
        price: 500,
        category: FoodCategory.riceplate,
        availableAddons: [
          Addons(name: "Extra Masala", price: 50),
          Addons(name: "Extra Kanda", price: 10),
          Addons(name: "Extra Rassa", price: 30)
        ],
    ),
    Food(name: "Mutton Thali",
      description: "The mutton thali had unlimited jowar rotis, with mutton gravy, goat intestine gravy and egg gravy. The jowar rotis are prepared fresh and served hot. ",
      imagePath: "lib/images/riceplate/rice2.jpeg",
      price: 500,
      category: FoodCategory.riceplate,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50),
        Addons(name: "Extra Kanda", price: 10),
        Addons(name: "Extra Rassa", price: 30)
      ],
    ),
    Food(name: "Spicy Fish Thali",
      description: "This thali contains tawa kolambi fry, bangda curry, tandalachi bhakari, pomfret fry, solkadhi and rice. ",
      imagePath: "lib/images/riceplate/rice3.jpeg",
      price: 500,
      category: FoodCategory.riceplate,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50),
        Addons(name: "Extra Kanda", price: 10),
        Addons(name: "Extra Rassa", price: 30)
      ],
    ),
    Food(name: "Kokani Fish Thali",
      description: "This thali contains tawa kolambi fry, bangda curry, tandalachi bhakari, pomfret fry, solkadhi and rice. ",
      imagePath: "lib/images/riceplate/rice4.jpeg",
      price: 500,
      category: FoodCategory.riceplate,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50),
        Addons(name: "Extra Kanda", price: 10),
        Addons(name: "Extra Rassa", price: 30)
      ],
    ),
    Food(name: "Crab Thali",
      description: "It comes with a generous portion of Crab curry, Our. speciality Prawns Sautallela, Fish Curry, Solkadhi, Prawns Pickle, Jawla Chutney, Mirgunda, Bhakri/Chapati and Rice.",
      imagePath: "lib/images/riceplate/rice5.jpeg",
      price: 500,
      category: FoodCategory.riceplate,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50),
        Addons(name: "Extra Kanda", price: 10),
        Addons(name: "Extra Rassa", price: 30),
      ],
    ),

    //salad

    Food(name: "Western",
      description: "Just Salad.",
      imagePath: "lib/images/salads/salad1.jpeg",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50)
      ],
    ),
    Food(name: "Just Cucumber.",
      description: "This cucumber salad recipe is made with fresh dill, onions, and a sweet and tangy vinegar dressing. It's an easy, delicious summer side dish.",
      imagePath: "lib/images/salads/salad2.jpeg",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50)
      ],
    ),
    Food(name: "Kanda",
      description: "Just Kanda.",
      imagePath: "lib/images/salads/salad3.jpeg",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50)
      ],
    ),
    Food(name: "Chana",
      description: "Just Chana.",
      imagePath: "lib/images/salads/salad4.jpeg",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50)
      ],
    ),
    Food(name: "Koshimbir Classic.",
      description: "It’s a great fasting recipe too. Easy to make and cool for the tummy.",
      imagePath: "lib/images/salads/salad5.jpeg",
      price: 50,
      category: FoodCategory.salads,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50)
      ],
    ),

    //sides
    Food(name: "Bhaji Classic.",
      description: "A bhaji is a small piece of food of Indian origin, made of vegetables fried in batter with spices.",
      imagePath: "lib/images/sides/sides1.jpeg",
      price: 50,
      category: FoodCategory.sides,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50)
      ],
    ),

    //deserts
    Food(name: "Pudding Classic.",
      description: " A soft, spongy, or thick creamy consistency",
      imagePath: "lib/images/deserts/deserts1.jpeg",
      price: 100,
      category: FoodCategory.deserts,
      availableAddons: [
        Addons(name: "Extra Nuts", price: 50)
      ],
    ),

    //drinks
    Food(name: "Lassi Classic.",
      description: "A creamy, frothy yogurt-based drink, blended with water and various fruits or seasonings (such as salt or sugar), that originated in Punjab, India.",
      imagePath: "lib/images/drinks/drinks1.jpeg",
      price: 80,
      category: FoodCategory.drinks,
      availableAddons: [
        Addons(name: "Extra Masala", price: 50)
      ],
    ),

  ];

  /*
  G E T T E R S
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

/*
  O P E R A T I O N S
  */

  //users cart
  final List<CartItem> _cart = [];

// add to cart
void addToCart(Food food, List<Addons> selectedAddons) {
  //see if there is a cart item already with the same food and selected addons
  CartItem? cartItem = _cart.firstWhereOrNull((item) {
    //check if the food item are same
     bool isSameFood = item.food == food;

    //check if the list of selected addons are the same
      bool isSameAddons =
      ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
  });

  //if item already exist, increase it's quantity
  if (cartItem !=null) {
    cartItem.quantity++;
  }

  //otherwise, add a new cart item to the cart
  else{
    _cart.add(
    CartItem(
      food: food,
      selectedAddons: selectedAddons,
      ),
    );
  }
  notifyListeners();
}

//remove from cart

void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);

  if (cartIndex != -1) {
    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
    }

  }
  notifyListeners();
}

//get total price of cart

double getTotalPrice() {
  double total = 0.0;
  for (CartItem cartItem in _cart) {
    double itemTotal = cartItem.food.price;

    for (Addons addons in cartItem.selectedAddons) {
      itemTotal += addons.price;
    }
    total += itemTotal * cartItem.quantity;
  }
  return total;
}

//get total number of items in cart

int getTotalItemCount() {
  int totalItemCount = 0;

  for (CartItem cartItem in _cart) {
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
}

//clear cart

void  clearCart () {
  _cart.clear();
  notifyListeners();
}

/*
  H E L P E R S
  */

//generate receipts
String displayCartRecipt() {
  final recipt = StringBuffer();
  recipt.writeln("Here's your Recipt.");
  recipt.writeln();

  //format the date to include up to seconds only
  String formattedDate = DateFormat('yyyy-MM-dd HH:MM:ss').format(DateTime.now());

  recipt.writeln(formattedDate);
  recipt.writeln();
  recipt.writeln("-----------");

  for (final cartItem in _cart) {
    recipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
    if (cartItem.selectedAddons.isNotEmpty) {
      recipt.writeln(" Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
    }
    recipt.writeln();
  }
  recipt.writeln("----------");
  recipt.writeln();
  recipt.writeln("Total Items: ${getTotalItemCount()}");
  recipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

  return recipt.toString();
}

//format double value into money
String _formatPrice(double price) {
  return "\₹${price.toStringAsFixed(2)}";
}

//format list of addons into a string summary
String _formatAddons(List<Addons> addons) {
  return addons
      .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
      .join(",");
}

}