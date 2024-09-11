import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sneaker_spot/screens/editProfilePage.dart';
import '../register/auth.dart';
import '../register/signupPage.dart';
import '../service/firestoreService.dart';

class AboutPage extends StatefulWidget {
  final String uid;

  AboutPage({required this.uid});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('About Me', style: TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: fetchUserData(widget.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No data found'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;
          _phoneController.text = userData['phoneNumber'] ?? 'Not Set';
          _addressController.text = userData['address'] ?? 'Not Set';

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 30,),
                  Container(
                    child: Center(child: CircleAvatar(
                      foregroundImage: NetworkImage(userData['photoURL']),
                      backgroundColor: Colors.grey,radius: 70,)),
                  ),
                  SizedBox(height: 30,),
                  Text('Name: ${userData['displayName']}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text('Email: ${userData['email']}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),

                  SizedBox(height: 15,),
                  Text(userData['phoneNumber'] != null ? 'Phone: ${userData['phoneNumber']}' : 'Phone: Not Set', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),

                  SizedBox(height: 15,),
                  Text(userData['address'] != null ? 'Address: ${userData['address']}' : 'Address: Not Set', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),

                  SizedBox(height: 25,),
                  Center(
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfilePage(uid: userData['uid'],)));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Row(
                            children: [
                              Icon(Icons.edit_rounded, color: Colors.black87,),
                              SizedBox(width: 20,),
                              Text('Edit Profile', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 17),),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: OutlinedButton(
                        onPressed: () {
                          user?.delete();
                          // UserController.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Regscrn()));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Row(
                            children: [
                              Icon(Icons.person_remove_alt_1_rounded, color: Colors.red,),
                              SizedBox(width: 20,),
                              Text('Delete this Account', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17),),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: OutlinedButton(
                        onPressed: () {
                          UserController.signOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Regscrn()));
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.power, color: Colors.black87,),
                              SizedBox(width: 20,),
                              Text('Log out', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 17),),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
