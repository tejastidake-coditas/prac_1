import 'package:dartz/dartz.dart';
import 'package:prac_1/core/networking/failure_constants.dart';
import 'package:prac_1/features/product_listing/domain/listing_entity.dart';

abstract interface class ListingRepository {
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts();
}
