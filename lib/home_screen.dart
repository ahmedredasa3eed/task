import 'package:flutter/material.dart';
import 'package:task/product_screen.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = 'home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This Is Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, ProductScreen.routeName);
              },
              child: Text("Product Screen"),
            ),
            Text("Created By : Ahmed Reda"),
          ],
        )
      ),
    );
  }
}
