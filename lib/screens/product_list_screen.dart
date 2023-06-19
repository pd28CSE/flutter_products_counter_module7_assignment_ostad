import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';
import './cart_screen.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int totalBuyingProduct = 0;
  List<Product> products = [
    Product(name: 'Python Book', price: 2.4),
    Product(name: 'Java Book', price: 4.5),
    Product(name: 'Dart Book', price: 8.0),
    Product(name: 'MacBook', price: 1000),
    Product(name: 'Dell Laptop', price: 800),
    Product(name: 'Asus Laptop', price: 820),
    Product(name: 'Ball', price: 1.40),
    Product(name: 'Router', price: 12.45),
    Product(name: 'OnePlus 9T', price: 400.6),
    Product(name: 'OnePlus 5T', price: 300.6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: products.length,
        itemBuilder: (BuildContext contxt, int index) {
          return ProductItem(
            product: products[index],
            updateOnPressed: () => updateProductCountStatus(
              products[index],
            ),
          );
        },
        separatorBuilder: (BuildContext contxt, int index) =>
            const SizedBox(height: 8.0),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Cart Items',
        onPressed: () {
          gotoCartPage();
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

  void updateProductCountStatus(Product product) {
    totalBuyingProduct++;
    setState(() {
      product.increment();
    });
  }

  void gotoCartPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return CartPage(
          totalProduct: totalBuyingProduct,
        );
      },
    ));
  }
}
