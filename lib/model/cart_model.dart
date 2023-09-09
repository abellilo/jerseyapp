import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{

  //list of item on sale
  final List _shopItem = [
    //[itemName, itemPrice, imagePath, color]
    ["Manchester United Home Kit","140.0","lib/images/manutd_jersey.png", Colors.red,"4.9"],
    ["Manchester United Third Kit","129.5","lib/images/manutd_jersey_white.png", Colors.pink,"4.8"],
    ["Manchester United Away Kit","127.8","lib/images/manutd_jersey_away.png", Colors.green,"4.7"],
    ["Chelsea Home Kit","190.8","lib/images/chelsea_jersey_home.png", Colors.blue,"4.9"],
    ["Chelsea Away Kit","140.4","lib/images/chelsea_away_jersey.png", Colors.purple,"4.75"],
    ["Manchester City Home Kit","178.0","lib/images/mancity_home_jersey.png", Colors.blue,"4.95"],
    ["Manchester City Away Kit","240.4","lib/images/mancity_away_jersey.png", Colors.brown,"4.82"],
    ["Arsenal Home Kit","167.7","lib/images/arsenal.png", Colors.red,"4.87"],
    ["Arsenal Away Kit","185.4","lib/images/arsenal_away_jersey.png", Colors.yellow,"4.92"],
    ["Arsenal Third Kit","185.0","lib/images/arsenal_third_jersey.png", Colors.green,"4.92"],
    ["Liverpool Home Kit","285.2","lib/images/liverpool_home_jersey.png", Colors.red,"4.95"],
    ["Liverpool Away Kit","239.5","lib/images/liverpool_away_jersey.png", Colors.green,"4.75"],
  ];

  //cart list item
  List _cartItems = [];

  get shopItem => _shopItem;

  get cartItem => _cartItems;

  //add item to cart
  void addItemToCart(int index){
    _cartItems.add(_shopItem[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String caculateTotal(){
    double totalPrice = 0;
    for(int i= 0; i < _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }

}