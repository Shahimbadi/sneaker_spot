import 'package:flutter/material.dart';

class MiniProductCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final String image;

  const MiniProductCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffD9D9D9),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    4,
                  ),
                  spreadRadius: 0,
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: MediaQuery.sizeOf(context).width * .63,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 17, top: 10, bottom: 10, right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.sizeOf(context).width * .31,
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text(
                            '₹ ${price.toString()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 25,
        child: Container(
          height: 100,
          child: Image(image: AssetImage(image)),
        ),
      ),
    ]);
  }
}
