import 'package:flutter/material.dart';
import 'package:jersey_app/pages/home_page.dart';
import 'package:jersey_app/pages/intro_page.dart';
import 'package:provider/provider.dart';

import 'model/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jersey App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: IntroPage(),
        routes: {
          '/home': (context)=> HomePage()
        },
      ),
    );
  }
}


