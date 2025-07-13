class CategoryModel {
  final String titel;
  final CategorysNames categorysNames;

  CategoryModel({required this.titel , required this.categorysNames});
}

enum CategorysNames {
  specialOffers,
  flashSale,
  newArri,
}
