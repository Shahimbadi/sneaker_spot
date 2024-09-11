import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_spot/screens/profilePage.dart';
import 'package:sneaker_spot/screens/searchPage.dart';

import 'cartPage.dart';

import 'favoritePage.dart';
import 'homePage.dart';


class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({super.key});

  @override
  State<NavBarFlotingWidget> createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  int currentIndex = 0;
  List screens = [
    const Homepage(),
    FavoritePage(),
    ShoeSearch(),
    CartPage(),
    ProfilePage()
  ];

  IconData home = CupertinoIcons.house_alt_fill;
  IconData search = CupertinoIcons.search;
  IconData fav = CupertinoIcons.heart;
  IconData cart = CupertinoIcons.cart;
  IconData profile = CupertinoIcons.person;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool shouldLeave = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Are you sure you want to exit the app?'),
              titleTextStyle: TextStyle(fontSize: 17, color: Colors.black),
              // content: Text('Do you want to exit the app?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 6, bottom: 6),
                        child: Text('Yes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      )),
                ),
              ],
            ),
          );
          return shouldLeave ?? false;
      },
      child: Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: Padding(
            padding: EdgeInsets.only(right: 0,left: 30),
            child: Padding(
              padding: EdgeInsets.all(13),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        5,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ClipRRect(borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2,
                      sigmaY: 2,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xDBFFFFFF),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                home,
                                color: Color(0xFF3F3F3F),
                                size: 25,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentIndex = 0;
                                  home = CupertinoIcons.house_alt_fill;
                                  search = CupertinoIcons.search;
                                  fav = CupertinoIcons.heart;
                                  cart = CupertinoIcons.cart;
                                  profile = CupertinoIcons.person;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                fav,
                                color: Color(0xFF3F3F3F),
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentIndex = 1;
                                  home = CupertinoIcons.house_alt;
                                  search = CupertinoIcons.search;
                                  fav = CupertinoIcons.heart_fill;
                                  cart = CupertinoIcons.cart;
                                  profile = CupertinoIcons.person;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                search,
                                color: Color(0xFF3F3F3F),
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentIndex = 2;
                                  home = CupertinoIcons.house_alt;
                                  search = CupertinoIcons.search_circle_fill;
                                  fav = CupertinoIcons.heart;
                                  cart = CupertinoIcons.cart;
                                  profile = CupertinoIcons.person;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                cart,
                                color: Color(0xFF3F3F3F),
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentIndex = 3;
                                  home = CupertinoIcons.house_alt;
                                  search = CupertinoIcons.search;
                                  fav = CupertinoIcons.heart;
                                  cart = CupertinoIcons.cart_fill;
                                  profile = CupertinoIcons.person;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                profile,
                                color: Color(0xFF3F3F3F),
                                size: 30,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentIndex = 4;
                                  home = CupertinoIcons.house_alt;
                                  search = CupertinoIcons.search;
                                  fav = CupertinoIcons.heart;
                                  cart = CupertinoIcons.cart;
                                  profile = Icons.person;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: screens[currentIndex]
      ),
    );
  }
}