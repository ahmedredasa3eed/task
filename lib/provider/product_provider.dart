import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {

  int items = 0;
  int box = 0;
  int container = 0;
  double price  = 0;


  void increaseItem(){
    items++;
    price = items * 10.0;
    notifyListeners();
  }

  void decreaseItem(){
    items--;
    if(items <= 0){
      items = 0;
      price = items * 10.0;
    }
    notifyListeners();
  }

  void increaseBox(){
    box++;
    price = box * 10.0 * 10.0;
    items = 0;
    notifyListeners();
  }

  void decreaseBox(){
    box--;
    if(box <= 0){
      box = 0;
      price = box * 10.0 * 10.0;
    }
    items =0;
    notifyListeners();
  }

  void increaseContainer(){
    container++;
    price = container * 100.0 * 10.0;
    notifyListeners();
  }

  void decreaseContainer(){
    container--;
    if(container <= 0){
      container = 0;
      price = container * 100.0 * 10.0;
    }
    notifyListeners();
  }

}