import 'package:get/get.dart';

import '../models/product.dart';
class ShoppingController extends GetxController{
  var products = <Product>[].obs;
  @override
  void onInit(){
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
        id:1,
        price:30,
        productDescription: 'some description about the product',
        productImage: 'abd',
        productName: 'FirstProduct'),
      Product(
          id:2,
          price:40,
          productDescription: 'some description about the product',
          productImage: 'abd',
          productName: 'SecondProduct'),
      Product(
          id:3,
          price:50,
          productDescription: 'some description about the product',
          productImage: 'abd',
          productName: 'ThirdProduct'),
    ];
    products.value=productResult;
  }
}