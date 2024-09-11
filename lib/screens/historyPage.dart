import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_spot/screens/productPage.dart';
import 'package:sneaker_spot/screens/widgets/miniProductCard.dart';
import '../provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recently Viewed',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<ShoeProvider>(
        builder: (context, shoeProvider, child) {
          final historyItems = shoeProvider.history;

          if (historyItems.isEmpty) {
            return Center(
              child: Center(child: Text('You have not recently viewed any item')),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    itemCount: historyItems.length,
                    itemBuilder: (context, index) {
                      final shoe = historyItems[index];
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
                                  shoeProvider.removeHistory(shoe);
                                },
                              ),
                            )
                          ]));
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
