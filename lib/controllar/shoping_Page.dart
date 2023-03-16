import 'package:firstgetx/model/product.dart';
import 'package:get/get.dart';

class shoping_controllar extends GetxController {
  var Products = <Product>[].obs;
  @override
  void onInit() {
    // this as like a init state function in view page like
    super.onInit();
    fetchData(); // init state load this function
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    var ServerRenponse = [
      Product(
          id: 1,
          ProductName: 'car',
          ProductImage: 'carimage',
          ProductDescription: 'this a car',
          ProductPrice: 200000),
      Product(
          id: 1,
          ProductName: 'cars',
          ProductImage: 'carsimage',
          ProductDescription: 'this a cars',
          ProductPrice: 30000),
      Product(
          id: 1,
          ProductName: 'ca',
          ProductImage: 'camage',
          ProductDescription: 'tis a car',
          ProductPrice: 560000),
      Product(
          id: 1,
          ProductName: 'car',
          ProductImage: 'carimage',
          ProductDescription: 'this a car',
          ProductPrice: 20000)
    ];
    Products.value = ServerRenponse; //this assign in get
  }

  void addTocart(Product product) {}
}
