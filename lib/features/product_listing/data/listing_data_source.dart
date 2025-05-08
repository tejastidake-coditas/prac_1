import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prac_1/core/networking/failure_constants.dart';
import 'package:prac_1/core/networking/network_constants.dart';
import 'package:prac_1/core/networking/network_service.dart';
import 'package:prac_1/core/utils/enums/method_enum.dart';
import 'package:prac_1/features/product_listing/data/listing_model.dart';
import 'package:prac_1/features/product_listing/domain/listing_entity.dart';

abstract interface class ListingDataSource {
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts();
}

class ListingDataSourceImpl implements ListingDataSource {
  final NetworkService networkService;
  ListingDataSourceImpl(this.networkService);

  @override
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    try {
      final result = await networkService.request(
        NetworkConstants.productEndPoint,
        Method.get,
      );
      return result.fold((failure) => Left(failure), (respose) {
        if (respose.data is Map<String, dynamic>) {
          final List data = respose.data['products'] ?? [];
          final products =
              data.map((products) => ListingModel.fromJson(products)).toList();
          return Right(products);
        } else {
          return Left(UnexpectedFormat());
        }
      });
    } on DioException {
      return Left(UnknownFailure());
    }
  }
}
