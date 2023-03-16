import 'package:get/get.dart';

import '../model/product.dart';

class CartController extends GetxController {
  var CartItem = <Product>[].obs;
  int get count => CartItem.length;
  double get totalPrice =>
      CartItem.fold(0, (sum, item) => sum + item.ProductPrice);

  var testvalue =
      0.0; // use for get builder in as like a getx but little bit difference

  void addTocart(Product product) {
    CartItem.add(product);
    testvalue = totalPrice; // this line is use for get builder
    update(); // use for get builder
  }
}
