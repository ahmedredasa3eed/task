import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/home_screen.dart';
import 'package:task/product_screen.dart';
import 'package:task/provider/product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          ProductScreen.routeName: (context) => ProductScreen(),
        },
      ),
    );
  }
}
