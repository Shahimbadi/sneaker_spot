import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;
  final IconData favIcon;

  ProductCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
    required this.favIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(17),
        child: Container(
          // height: 300,
          // color: Colors.red,
          decoration: BoxDecoration(
            color: Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  4,
                ),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column( mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            itemName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            '₹${itemPrice}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(color, overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 8,
        left: 8,
        child:
        Container(
          height: MediaQuery.sizeOf(context).width * 0.35,
          width: MediaQuery.sizeOf(context).width * 0.47,
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
      Positioned(
          right: 15,
          top: 15,
          child:
          IconButton(onPressed: onPressed, icon: Icon(favIcon)))
    ]);
  }
}
