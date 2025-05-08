import 'package:dartz/dartz.dart';
import 'package:prac_1/core/networking/failure_constants.dart';
import 'package:prac_1/features/product_listing/domain/listing_entity.dart';
import 'package:prac_1/features/product_listing/domain/listing_repository.dart';

class ListingUsecase {
  final ListingRepository listingRepository;
  ListingUsecase(this.listingRepository);

  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    final result = await listingRepository.getAllProducts();

    return result.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
