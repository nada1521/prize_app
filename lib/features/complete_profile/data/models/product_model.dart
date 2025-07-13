class ProductModel {
  final String image;
  final String newPrice;
  final String oldPrice;
  final String title;
  final bool? isOffer;
  int? quantity;

  ProductModel({
    required this.image,
    required this.newPrice,
    required this.oldPrice,
    required this.title,
     this.isOffer,
     this.quantity = 0,
  });
}
