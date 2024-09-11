import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_spot/screens/productPage.dart';
import 'package:sneaker_spot/screens/widgets/miniProductCard.dart';
import '../provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Favorite',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Consumer<ShoeProvider>(
        builder: (context, shoeProvider, child) {
          final favoriteShoes =
              shoeProvider.shoes.where((shoe) => shoe.isFavorite).toList();

          if (favoriteShoes.isEmpty) {
            return Center(
              child: Center(child: Text('No favorite shoes yet!')),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Let's order fresh items for you
              SizedBox(
                height: 20,
              ),

              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    itemCount: favoriteShoes.length,
                    itemBuilder: (context, index) {
                      final shoe = favoriteShoes[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(shoe: shoe),
                              ),
                            );
                            Provider.of<ShoeProvider>(context, listen: false)
                                .addHistory(shoe);
                          },
                          child: Stack(children: [
                            MiniProductCard(
                              title: shoe.name,
                              subTitle: shoe.description,
                              price: shoe.price.toString(),
                              image: shoe.imagePath,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 20,
                              child: IconButton(
                                icon: Icon(
                                  shoe.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 20,
                                ),
                                onPressed: () {
                                  shoeProvider.toggleFavoriteStatus(
                                      shoeProvider.shoes.indexOf(shoe));
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
