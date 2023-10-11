import 'package:cartapp/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CartProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartPage(),
    );
  }
}
