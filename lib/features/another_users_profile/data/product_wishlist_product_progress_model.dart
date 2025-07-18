// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:prize/features/complete_profile/data/models/product_model.dart';

class ProductWishlistProductProgressModel {
  final ProductModel product;
  final double precent;
  final DateTime eventDate;
  final String eventName;

  final List<ContributorsModel> contributors;
  ProductWishlistProductProgressModel({
    required this.product,
    required this.precent,
    required this.eventDate,
    required this.contributors,
    required this.eventName,
  });
}

class ContributorsModel {
  final String contributorName;
  final String contributorProfileUrl;
  ContributorsModel({
    required this.contributorName,
    required this.contributorProfileUrl,
  });
}
