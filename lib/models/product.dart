class Product {
  String name;
  double price;
  int totalQuantity = 0;

  Product({required this.name, required this.price});

  String get getName {
    return name;
  }

  double get getPrice {
    return price;
  }

  int get getTotalQuantity {
    return totalQuantity;
  }

  void increment() {
    totalQuantity++;
  }
}
