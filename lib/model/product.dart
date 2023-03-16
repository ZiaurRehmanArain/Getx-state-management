import 'package:get/get.dart';

class Product {
  final int id;
  final String ProductName;
  final String ProductImage;
  final String ProductDescription;
  final int ProductPrice;
  Product(
      {required this.id,
      required this.ProductName,
      required this.ProductImage,
      required this.ProductDescription,
      required this.ProductPrice});
      final favorite=false.obs;
}
