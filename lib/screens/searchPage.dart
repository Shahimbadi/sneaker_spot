import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_spot/screens/productPage.dart';
import 'package:sneaker_spot/screens/widgets/miniProductCard.dart';
import '../provider/provider.dart';

class ShoeSearch extends StatefulWidget {
  @override
  _ShoeSearchState createState() => _ShoeSearchState();
}

class _ShoeSearchState extends State<ShoeSearch> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final shoeProvider = Provider.of<ShoeProvider>(context);
    final shoes = _searchQuery.isEmpty
        ? shoeProvider.shoes
        : shoeProvider.searchShoes(_searchQuery);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'Explore',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search),
                hintText: 'Search shoes...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
        ),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 100, left: 5, right: 5),
          child: ListView.builder(
            itemCount: shoes.length,
            itemBuilder: (context, index) {
              final shoe = shoes[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(shoe: shoe),
                      ),
                    );
                    Provider.of<ShoeProvider>(context, listen: false)
                        .addHistory(shoe);
                  },
                  child: MiniProductCard(
                      title: shoe.brand,
                      subTitle: shoe.name,
                      price: shoe.price.toString(),
                      image: shoe.imagePath));
            },
          ),
        ),
      ),
    );
  }
}
