import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_1/features/product_listing/domain/listing_usecase.dart';
import 'package:prac_1/features/product_listing/presentation/bloc/listing_event.dart';
import 'package:prac_1/features/product_listing/presentation/bloc/listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final ListingUsecase listingUsecase;

  ListingBloc(this.listingUsecase) : super(InitialState()) {
    on<GetAllProductsEvent>(_getAllProducts);
  }

  Future<void> _getAllProducts(
    GetAllProductsEvent event,
    Emitter<ListingState> emit,
  ) async {
    emit(ProductLoadingState());
    final result = await listingUsecase.getAllProducts();

    return result.fold(
      (failure) {
        emit(ProductErrorState(failure.message));
      },
      (product) {
        emit(ProductLoadingState());
        emit(ProductListingState(product));
      },
    );
  }
}
