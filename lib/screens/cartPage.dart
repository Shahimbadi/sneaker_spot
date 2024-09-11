import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_spot/screens/cartPayment.dart';
import 'package:sneaker_spot/screens/productPage.dart';
import 'package:sneaker_spot/screens/widgets/miniProductCard.dart';

import '../provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<ShoeProvider>(
        builder: (context, shoeProvider, child) {
          final cartItems = shoeProvider.cartItems;

          if (cartItems.isEmpty) {
            return Center(
              child: Center(child: Text('No items in the cart')),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Let's order fresh items for you
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  '${cartItems.length} items in the cart',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final shoe = cartItems[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(shoe: shoe),
                              ),
                            );
                          },
                          child: Stack(children: [
                            MiniProductCard(
                                title: shoe.name,
                                subTitle: shoe.description,
                                price: shoe.price.toString(),
                                image: shoe.imagePath),
                            Positioned(
                              bottom: 10,
                              right: 20,
                              child: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  shoeProvider.removeItemFromCart(shoe);
                                },
                              ),
                            )
                          ]));
                    },
                  ),
                ),
              ),

              // total amount + pay now
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: Colors.green[200]),
                          ),

                          const SizedBox(height: 8),
                          // total price
                          Text(
                            '₹${shoeProvider.calculateTotal()}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // pay now
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateColor.transparent,
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: Colors.white)))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPayment(shoeCount: cartItems.length, totalPrice: shoeProvider.calculateTotal())));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: const [
                              Text(
                                'Buy All',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              )
            ],
          );
        },
      ),
    );
  }
}
