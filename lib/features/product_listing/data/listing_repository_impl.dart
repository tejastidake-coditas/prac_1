import 'package:dartz/dartz.dart';
import 'package:prac_1/core/networking/failure_constants.dart';
import 'package:prac_1/features/product_listing/data/listing_data_source.dart';
import 'package:prac_1/features/product_listing/domain/listing_entity.dart';
import 'package:prac_1/features/product_listing/domain/listing_repository.dart';

class ListingRepositoryImpl implements ListingRepository {
  final ListingDataSource listingDataSource;
  ListingRepositoryImpl(this.listingDataSource);

  @override
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    final result = await listingDataSource.getAllProducts();
    return result.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
