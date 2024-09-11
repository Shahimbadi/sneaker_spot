import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_spot/screens/historyPage.dart';
import 'accpage.dart';
import 'orderedItemsPage.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {


    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              child: Center(child: CircleAvatar(
                foregroundImage: NetworkImage('${user?.photoURL}'),
                backgroundColor: Colors.grey,radius: 70,)),
            ),
            SizedBox(height: 30,),
            Text('${user?.displayName}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 1,),
            Text('${user?.email}', style: TextStyle(fontWeight: FontWeight.bold),),
            // Text('${user?.phoneNumber}', style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PurchasesPage()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width * 0.6,
              child: Row(
                children: [
                  Icon(CupertinoIcons.bag_fill, color: Colors.black87,),
                  SizedBox(width: 20,),
                  Text('My Orders', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 17),),
                ],
              ),
            )),
            SizedBox(height: 15,),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutPage(uid: user!.uid,)));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.person_alt_circle_fill, color: Colors.black87,),
                      SizedBox(width: 20,),
                      Text('About Me', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 17),),
                    ],
                  ),
                )),
            SizedBox(height: 15,),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> History()));
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.eye_fill, color: Colors.black87,),
                      SizedBox(width: 20,),
                      Text('Recently Viewed', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 17),),
                    ],
                  ),
                )),


            SizedBox(height: 100,),

          ],
        ),
      ),
    );
  }
}
