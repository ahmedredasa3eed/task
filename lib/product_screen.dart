import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/data_source.dart';
import 'package:task/provider/product_provider.dart';
import 'package:task/style/style.dart';
import 'package:task/widgets/custom_button.dart';
import 'package:task/widgets/slider.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = 'product-screen';

  @override
  Widget build(BuildContext context) {
    print("ddd");
    final DataSource _dataSource = DataSource();
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(
            _dataSource.products[0].name,
            style: kTitleText,
          ),
          ImageSlider(),
          Text(
            "Required Quantity",
            style: kNormalText,
          ),
          SizedBox(height: 16),
          Consumer<ProductProvider>(
            builder: (context, product, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${product.container} Container - ",
                  style: kConsumerText,
                ),
                SizedBox(width: 4),
                Text(
                  "${product.box} Box - ",
                  style: kConsumerText,
                ),
                SizedBox(width: 4),
                Text(
                  "${product.items} item",
                  style: kConsumerText,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Consumer<ProductProvider>(
            builder: (context,product,child)=> Text("${product.price} EGP", style: kNormalText),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Increase the quantity",style: kSmallText,),
              SizedBox(width: 40),
              Text("Decrease the quantity",style: kSmallText,),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Item",
            style: kNormalText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                icon: (Icons.add),
                onTap: () {
                  productProvider.container > 0 || productProvider.box > 0
                      ? null
                      : productProvider.increaseItem();
                },
              ),
              SizedBox(width: 80),
              CustomButton(
                icon: (Icons.remove),
                onTap: () {
                  productProvider.container > 0 || productProvider.box > 0
                      ? null
                      : productProvider.decreaseItem();
                },
              ),
            ],
          ),


          SizedBox(
            height: 30,
          ),
          Text(
            "Box",
            style: kNormalText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                icon: (Icons.add),
                onTap: () {
                  productProvider.items > 0 || productProvider.container > 0
                      ? null
                      : productProvider.increaseBox();
                },
              ),
              SizedBox(width: 80),
              CustomButton(
                icon: (Icons.remove),
                onTap: () {
                  productProvider.items > 0 || productProvider.container > 0
                      ? null
                      : productProvider.decreaseBox();
                },
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),

          Text(
            "Container",
            style: kNormalText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                icon: (Icons.add),
                onTap: () {
                  productProvider.items >0  || productProvider.box > 0
                      ? null
                      : productProvider.increaseContainer();
                },
              ),
              SizedBox(width: 80),
              CustomButton(
                icon: (Icons.remove),
                onTap: () {
                  productProvider.items > 0 || productProvider.box > 0
                      ? null
                      : productProvider.decreaseContainer();
                },
              ),
            ],
          ),

        ],
      ),
    );
  }
}
