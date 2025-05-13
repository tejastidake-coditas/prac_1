import 'package:get_it/get_it.dart';
import 'package:prac_1/core/networking/network_service.dart';
import 'package:prac_1/features/product_listing/data/listing_data_source.dart';
import 'package:prac_1/features/product_listing/data/listing_repository_impl.dart';
import 'package:prac_1/features/product_listing/domain/listing_repository.dart';
import 'package:prac_1/features/product_listing/domain/listing_usecase.dart';
import 'package:prac_1/features/product_listing/presentation/bloc/listing_bloc.dart';

class Injector {
  static final injectorInstatnce = GetIt.instance;

  static void init() {
    injectorInstatnce.registerLazySingleton<NetworkService>(
      () => NetworkService(),
    );

    injectorInstatnce.registerLazySingleton<ListingDataSource>(
      () => ListingDataSourceImpl(injectorInstatnce<NetworkService>()),
    );

    injectorInstatnce.registerLazySingleton<ListingRepository>(
      () => ListingRepositoryImpl(injectorInstatnce<ListingDataSource>()),
    );

    injectorInstatnce.registerLazySingleton<ListingUsecase>(
      () => ListingUsecase(injectorInstatnce<ListingRepository>()),
    );

    injectorInstatnce.registerFactory<ListingBloc>(
      () => ListingBloc(injectorInstatnce<ListingUsecase>()),
    );
  }
}
