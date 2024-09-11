import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_spot/screens/productPage.dart';
import 'package:sneaker_spot/screens/widgets/productCard.dart';
import '../provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage('assets/bgImages/SneakerSpot_Text.png'),
          height: 25,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bgImages/HomeBg.png"),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  "Collections",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              ///
              Consumer<ShoeProvider>(
                builder: (context, shoeProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Container(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: shoeProvider.brands.length,
                        itemBuilder: (context, index) {
                          final brand = shoeProvider.brands[index];
                          return GestureDetector(
                            onTap: () {
                              shoeProvider.selectBrand(brand);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                color: shoeProvider.selectedBrand == brand
                                    ? Colors.black87
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(color: Colors.black87),
                              ),
                              child: Center(
                                child: Text(
                                  brand,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: shoeProvider.selectedBrand == brand
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),

              ///

              SizedBox(
                height: 20,
              ),

              Container(
                child: Consumer<ShoeProvider>(
                  builder: (context, shoeProvider, child) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: shoeProvider.shoes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 0, // Spacing between columns
                          mainAxisSpacing: 10.0, // Spacing between rows
                          childAspectRatio: 3 / 3.71),
                      itemBuilder: (context, index) {
                        final shoe = shoeProvider.shoes[index];
                        return Container(
                          child: GestureDetector(
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
                            child: ProductCard(
                              itemName: shoe.brand,
                              itemPrice: '${shoe.price}',
                              imagePath: shoe.imagePath,
                              color: shoe.name,
                              onPressed: () =>
                                  shoeProvider.toggleFavoriteStatus(index),
                              favIcon: shoe.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 85,
              )
            ],
          ),
        ),
      ),
    );
  }
}
