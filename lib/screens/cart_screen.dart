import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int totalProduct;
  const CartPage({
    super.key,
    required this.totalProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total Products: $totalProduct'),
      ),
    );
  }
}
