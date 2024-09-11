import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_spot/provider/provider.dart';
import 'package:sneaker_spot/screens/splash/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCpcu-6rSECulE6VbzZB-m-QfIv0tQzxoI",
          appId: "1:352634971378:android:8d9c44f2bdb8ba26209c6b",
          messagingSenderId: "",
          projectId: "sneakerspot-7ddf0",
          storageBucket: "sneakerspot-7ddf0.appspot.com"));
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SneakerSpot',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
