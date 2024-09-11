import 'dart:math';

import 'package:flutter/material.dart';

import '../model/cart_model.dart';



class ShoeProvider with ChangeNotifier {

  List<Shoe> _shoes = [
    Shoe(
        name: 'Nike Air Max',
        price: 999.0,
        imagePath: 'assets/image/nike1.png',
        imagePath2: 'assets/image/nike12.png',
        imagePath3: 'assets/image/nike13.png',
        description: 'Comfortable and stylish Nike Air Max shoes.',
        brand: 'Nike',
        colors: ['Green', 'Blue', 'Red'],
        gender: 'Men'
    ),
    Shoe(
        name: 'Adidas Yeezy Boost 350',
        price: 11499.0,
        imagePath: 'assets/image/adidas3.png',
        imagePath2: 'assets/image/adidas32.png',
        imagePath3: 'assets/image/adidas33.png',
        description: 'Trendy and exclusive Adidas Yeezy Boost 350 sneakers.',
        brand: 'Adidas',
        colors: ['Black', 'Yellow', 'Blue'],
        gender: 'Men'
    ),
    Shoe(
        name: 'Puma Suede Classic X OnePiece Edition',
        price: 8999.0,
        imagePath: 'assets/image/puma2.png',
        imagePath2: 'assets/image/puma22.png',
        imagePath3: 'assets/image/puma23.png',
        description: 'Iconic Puma Suede Classic shoes with a timeless design.',
        brand: 'Puma',
        colors: ['Orange', 'Red', 'Green'],
        gender: 'Unisex'
    ),
    Shoe(
        name: 'New Balance 574',
        price: 6559.0,
        imagePath: 'assets/image/nb3.png',
        imagePath2: 'assets/image/nb32.png',
        imagePath3: 'assets/image/nb33.png',
        description: 'Classic and versatile New Balance 574 sneakers.',
        brand: 'New Balance',
        colors: ['Red', 'Blue', 'Green'],
        gender: 'Unisex'
    ),
    Shoe(
        name: 'Nike Air Zoom Pegasus',
        price: 8209.0,
        imagePath: 'assets/image/nike2.png',
        imagePath2: 'assets/image/nike22.png',
        imagePath3: 'assets/image/nike23.png',
        description: 'Responsive and lightweight Nike Air Zoom Pegasus running shoes.',
        brand: 'Nike',
        colors: ['Green','Red', 'Blue'],
        gender: 'Unisex'
    ),
    Shoe(
        name: 'Adidas Ultraboost',
        price: 7599.00,
        imagePath: 'assets/image/adidas1.png',
        imagePath2: 'assets/image/adidas12.png',
        imagePath3: 'assets/image/adidas13.png',
        description: 'High-performance Adidas Ultraboost running shoes.',
        brand: 'Adidas',
        colors: ['Black-White','Black-Green', 'Black-Violet'],
        gender: 'Men'
    ),
    Shoe(
        name: 'Puma RS-X',
        price: 4719.0,
        imagePath: 'assets/image/puma1.png',
        imagePath2: 'assets/image/puma12.png',
        imagePath3: 'assets/image/puma13.png',
        description: 'Trendy and comfortable Puma RS-X sneakers.',
        brand: 'Puma',
        colors: ['Colour 1','Colour 2', 'Colour 3'],
        gender: 'Unisex'
    ),
    Shoe(
        name: 'New Balance 990v5',
        price: 9399.0,
        imagePath: 'assets/image/nb1.png',
        imagePath2: 'assets/image/nb12.png',
        imagePath3: 'assets/image/nb13.png',
        description: 'Premium New Balance 990v5 sneakers for everyday wear.',
        brand: 'New Balance',
        colors: ['Grey','Violet', 'Green'],
        gender: 'Men'
    ),
    Shoe(
        name: 'Nike React Infinity Run',
        price: 7299.0,
        imagePath: 'assets/image/nike3.png',
        imagePath2: 'assets/image/nike32.png',
        imagePath3: 'assets/image/nike33.png',
        description: 'Supportive and cushioned Nike React Infinity Run shoes.',
        brand: 'Nike',
        colors: ['Black','Blue', 'Green'],
        gender: 'Men'
    ),
    Shoe(
        name: 'Adidas NMD_R1',
        price: 8999.0,
        imagePath: 'assets/image/adidas2.png',
        imagePath2: 'assets/image/adidas22.png',
        imagePath3: 'assets/image/adidas23.png',
        description: 'Stylish and comfortable Adidas NMD_R1 sneakers.',
        brand: 'Adidas',
        colors: ['Black','Yellow', 'Blue'],
        gender: 'Unisex'
    ),
    Shoe(
        name: 'Puma Future Rider',
        price: 3599.0,
        imagePath: 'assets/image/puma3.png',
        imagePath2: 'assets/image/puma32.png',
        imagePath3: 'assets/image/puma33.png',
        description: 'Retro-inspired Puma Future Rider sneakers.',
        brand: 'Puma',
        colors: ['Colour 1','Colour 2', 'Colour 3'],
        gender: 'Unisex'
    ),
    Shoe(
        name: 'New Balance Fresh Foam 1080v11',
        price: 8799.0,
        imagePath: 'assets/image/nb2.png',
        imagePath2: 'assets/image/nb22.png',
        imagePath3: 'assets/image/nb23.png',
        description: 'Comfortable and cushioned New Balance Fresh Foam 1080v11 running shoes.',
        brand: 'New Balance',
        colors: ['Black','Red', 'Green'],
        gender: 'Men'
    ),
    Shoe(
        name: 'Nike Air Force 1',
        price: 8199.0,
        imagePath: 'assets/image/nike4.png',
        imagePath2: 'assets/image/nike42.png',
        imagePath3: 'assets/image/nike43.png',
        description: 'Classic and versatile Nike Air Force 1 sneakers.',
        brand: 'Nike',
        colors: ['Brown','Green', 'Blue'],
        gender: 'Women'
    ),
    Shoe(
        name: 'Adidas Superstar',
        price: 6599.0,
        imagePath: 'assets/image/adidas4.png',
        imagePath2: 'assets/image/adidas42.png',
        imagePath3: 'assets/image/adidas43.png',
        description: 'Iconic Adidas Superstar shoes with a timeless design.',
        brand: 'Adidas',
        colors: ['Green-Red','Green-Green', 'Violet-Blue'],
        gender: 'Men'
    ),
    Shoe(
        name: 'Puma Cali',
        price: 4199.0,
        imagePath: 'assets/image/puma4.png',
        imagePath2: 'assets/image/puma42.png',
        imagePath3: 'assets/image/puma43.png',
        description: 'Stylish and versatile Puma Cali shoes.',
        brand: 'Puma',
        colors: ['Cyan','Violet', 'Red'],
        gender: 'Women'
    ),
    Shoe(
        name: 'New Balance FuelCell Rebel v4',
        price: 9399.0,
        imagePath: 'assets/image/nb4.png',
        imagePath2: 'assets/image/nb42.png',
        imagePath3: 'assets/image/nb43.png',
        description: 'Lightweight and responsive New Balance FuelCell Rebel v2 running shoes.',
        brand: 'New Balance',
        colors: ['Blue','Green', 'Pink'],
        gender: 'Men'
    ),
    // Add more shoes as needed
  ];

  String selectedBrand = 'All';

  List<Shoe> get shoes {
    if (selectedBrand == 'All') {
      return _shoes;
    } else {
      return _shoes.where((shoe) => shoe.brand == selectedBrand).toList();
    }
  }

  List<String> get brands {
    return ['All', ..._shoes.map((shoe) => shoe.brand).toSet()];
  }

  void selectBrand(String brand) {
    selectedBrand = brand;
    notifyListeners();
  }

  void toggleFavoriteStatus(int index) {
    _shoes[index].isFavorite = !_shoes[index].isFavorite;
    notifyListeners();
  }

  void addItemToCart(Shoe shoe) {
    _cartItems.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {
    _cartItems.remove(shoe);
    notifyListeners();
  }

  void shuffleShoes() {
    _shoes.shuffle(Random());
  }

  List<Shoe> _cartItems = [];
  List<Shoe> _history = [];

  List<Shoe> get cartItems => _cartItems;
  List<Shoe> get history => _history.reversed.toList();

  List<Shoe> searchShoes(String query) {
    return _shoes.where((shoe) {
      final nameLower = shoe.name.toLowerCase();
      final brandLower = shoe.brand.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) || brandLower.contains(searchLower);
    }).toList();
  }

  // calculate total price
  double calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += cartItems[i].price;
    }
    return totalPrice.toDouble();
  }

  void addHistory(Shoe shoe) {
    _history.add(shoe);
    // _history = _history.reversed.toList();
    notifyListeners();
  }

  void removeHistory(Shoe shoe) {
    _history.remove(shoe);
    notifyListeners();
  }
}

