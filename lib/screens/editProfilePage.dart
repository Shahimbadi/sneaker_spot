import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../service/firestoreService.dart';

class EditProfilePage extends StatefulWidget {
  final String uid;

  EditProfilePage({required this.uid});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,),
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
                  // Container(
                  //   child: Center(child: CircleAvatar(
                  //     foregroundImage: NetworkImage(userData['photoURL']),
                  //     backgroundColor: Colors.grey,radius: 70,)),
                  // ),
                  SizedBox(height: 30,),
                  Text('Name: ${userData['displayName']}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Text('Email: ${userData['email']}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),

                  SizedBox(height: 30,),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(height: 30,),
                  TextField(
                    controller: _addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: OutlinedButton(
                      onPressed: () async {
                        await updatePhoneNumber(widget.uid, _phoneController.text);
                        await updateAddress(widget.uid, _addressController.text);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Address updated')),
                        );
                      },
                      child: Text('Save', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    ),
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
