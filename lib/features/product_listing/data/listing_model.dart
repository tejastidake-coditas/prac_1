import 'package:prac_1/features/product_listing/domain/listing_entity.dart';

class ListingModel extends ProductListingEntity {
  const ListingModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.category,
    required super.price,
  });

  factory ListingModel.fromJson(Map<String, dynamic> json) => ListingModel(
    id: json['id'] ?? '',
    title: json['title'] ?? '',
    thumbnail: json['thumbnail'] ?? '',
    category: json['category'] ?? '',
    price: json['price'] ?? 0.0,
  );
}
