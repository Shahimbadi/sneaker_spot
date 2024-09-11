import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> storeUserData(User user) async {
  DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);

  DocumentSnapshot docSnapshot = await userDoc.get();
  if (!docSnapshot.exists) {
    await userDoc.set({
      'uid': user.uid,
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
    });
  } else {
    await userDoc.update({
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
    });
  }
}

Future<DocumentSnapshot> fetchUserData(String uid) async {
  return await FirebaseFirestore.instance.collection('users').doc(uid).get();
}

Future<void> updatePhoneNumber(String uid, String phoneNumber) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).update({
    'phoneNumber': phoneNumber,
  });
}

Future<void> updateAddress(String uid, String address) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).update({
    'address': address,
  });
}
