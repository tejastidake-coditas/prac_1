import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prac_1/core/di/injector.dart';
import 'package:prac_1/features/product_listing/presentation/bloc/listing_bloc.dart';
import 'package:prac_1/features/product_listing/presentation/bloc/listing_event.dart';
import 'package:prac_1/features/product_listing/presentation/bloc/listing_state.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListingBloc>(
      create:
          (_) =>
              Injector.injectorInstatnce<ListingBloc>()
                ..add(GetAllProductsEvent()),

      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ListingBloc, ListingState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductErrorState) {
                return Center(child: Text('Something Went Wrong'));
              } else if (state is ProductListingState) {
                if (state.products.isEmpty) {
                  return Center(child: Text('No Product Found'));
                }
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Card(child: Text(state.products[index].title));
                  },
                );
              }
              return Center(child: Text('Something is not getting'));
            },
          ),
        ),
      ),
    );
  }
}
