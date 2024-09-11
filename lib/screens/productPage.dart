import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_spot/screens/cartPage.dart';
import 'package:sneaker_spot/screens/purchaseDetailsPage.dart';
import '../model/cart_model.dart';
import '../provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Shoe shoe;

  ProductDetailPage({required this.shoe});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  String? selectedColor;

  String _selectedSize = '6';
  //
  final List<String> _sizes = ['5', '6', '7', '8', '9'];

  @override
  Widget build(BuildContext context) {

    String imagePath = selectedColor == widget.shoe.colors[2] ? widget.shoe.imagePath3 : selectedColor == widget.shoe.colors[1] ? widget.shoe.imagePath2 : widget.shoe.imagePath;




    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Image(image: AssetImage('assets/bgImages/SneakerSpot_Text.png'),height: 25,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // list view of cart
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              color: Colors.grey[350],
                              height: MediaQuery.sizeOf(context).height * 0.4,
                              width: 250,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
        
        
        
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Text(
                            'Colors:',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 30,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              // itemCount: _colors.length,
                              itemCount: widget.shoe.colors.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = widget.shoe.colors[index];
        
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: selectedColor == widget.shoe.colors[index] ? Colors.black87 : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.shoe.colors[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: selectedColor == widget.shoe.colors[index] ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Size options
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Text(
                            'Size:',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            height: 30,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _sizes.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = _sizes[index];
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: _selectedSize == _sizes[index] ? Colors.black : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _sizes[index],
                                        style: TextStyle(
                                          color: _selectedSize == _sizes[index] ? Colors.white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: SizedBox(
                              // width: 300,
                              child: Text(
                                widget.shoe.name,
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: SizedBox(
                            // width: 300,
                              child: Text(
                                widget.shoe.description,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25,),
                          child: Text('Gender: ${widget.shoe.gender}', style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
        
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // SizedBox(width: 30,),
                                  Text(
                                    '₹${widget.shoe.price}',
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                    Positioned(
                      top: 50,
        
                      // width: 500,
                      child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                              child: Image(image: AssetImage(imagePath), width: MediaQuery.of(context).size.width * 0.75,))),
                    )
                  ]),
                ),
              ),
              // SizedBox(height: 200)
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Container(
          height: 50,
          width: 400,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[350],
                      minimumSize: Size(150, 50)),
                  onPressed: () {
                    Provider.of<ShoeProvider>(context, listen: false)
                        .addItemToCart(widget.shoe);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * .5,
                              child: Text('${widget.shoe.name} added to cart')),
                          TextButton(
                              onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> CartPage()));
                          }, child: Text('View Cart') )
                        ],
                      )),
                    );
                  },
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      minimumSize: Size(150, 50)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseDetailsPage(shoe: widget.shoe, selectedColor: imagePath, selectedSize: _selectedSize,),
                      ),
                    );
                  },
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
