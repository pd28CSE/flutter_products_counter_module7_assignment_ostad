import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final VoidCallback updateOnPressed;
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
    required this.updateOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: product.totalQuantity > 0 ? true : false,
      selectedColor: Colors.black,
      selectedTileColor: Colors.grey.withOpacity(0.2),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      title: Text(product.getName),
      subtitle: Text('\$${product.getPrice.toStringAsFixed(2)}'),
      trailing: Column(
        children: <Widget>[
          Text(
            'Counter ${product.getTotalQuantity}',
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                updateOnPressed();
                if (product.getTotalQuantity == 5) {
                  showAlert(context, product.getName, product.getTotalQuantity);
                }
              },
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showAlert(
      BuildContext context, String productName, int productQuantity) {
    return showDialog<bool?>(
      context: context,
      builder: (cntxt) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: Text('You\'ve  brought $productQuantity $productName!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(cntxt).pop(true);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
