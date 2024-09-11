import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../screens/navbarPage.dart';
import '../service/firestoreService.dart';
import 'auth.dart';

class Regscrn extends StatefulWidget {
  const Regscrn({super.key});

  @override
  State<Regscrn> createState() => _RegscrnState();
}

class _RegscrnState extends State<Regscrn> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog(context) ?? false;
      },
      child: ResponsiveSizer(builder: (context, orientation, deviceType) {
        return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bgImages/RegBg.png"),
                    fit: BoxFit.fill)),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: Container(
                        width: 20.w,
                        child: Image(
                          image: AssetImage(
                            "assets/bgImages/SneakerSpot_Icon.png",
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 25,
                        color: Colors.transparent,
                        child: Image(
                          image: AssetImage(
                              'assets/bgImages/SneakerSpot_Text.png'),
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .2,
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(60)),
                        height: 60,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/image/google-icon.png"),
                              width: 6.w,
                              height: 8.h,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Sign in using Google",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                      onTap: ()
                        // {
                        //   Navigator.of(context).pushReplacement(
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //           const NavBarFlotingWidget()));
                        // }
                      async {
                        try {
                          final user = await UserController.loginWithGoogle();
                          if (user != null && mounted) {
                            storeUserData(user);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarFlotingWidget()));
                          }
                        } on FirebaseAuthException catch (error) {
                          print(error.message);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            error.message ?? "Something went wrong",
                          )));
                        } catch (error) {
                          print(error);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            error.toString(),
                          )));
                        }
                      },
                    ),
                  ],
                )));
      }),
    );
  }
}

Future<bool?> _showExitConfirmationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'Exit App',
          style: TextStyle(color: Colors.white),
        ),
        content: Text('Are you sure you want to exit the app?',
            style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text('Exit', style: TextStyle(color: Colors.red)),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
        ],
      );
    },
  );
}
