import 'package:flutter/material.dart';
import 'package:prac_1/core/di/injector.dart';
import 'package:prac_1/features/product_listing/presentation/screen/listing_screen.dart';

void main() {
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ListingScreen());
  }
}
