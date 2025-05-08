import 'package:equatable/equatable.dart';
import 'package:prac_1/features/product_listing/domain/listing_entity.dart';

sealed class ListingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends ListingState {}

class ProductLoadingState extends ListingState {}

class ProductListingState extends ListingState {
  final List<ProductListingEntity> products;
  ProductListingState(this.products);
}

class ProductErrorState extends ListingState {
  final String error;
  ProductErrorState(this.error);
}
