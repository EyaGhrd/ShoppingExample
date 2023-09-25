class Product{
  final int? id ;
  final String? productName;
  final String? productImage;
  final String? productDescription ;
   double price=0.0 ;
  Product({
     this.id,
     this.productName,
     this.productImage,
     this.productDescription,
    required this.price,
});
}