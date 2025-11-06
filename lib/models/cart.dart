import 'product.dart';

class Cart {
  static List<Product> items = [];

  static double get totalPrice {
    return items.fold(0, (sum, item) => sum + item.price);
  }

  static int get itemCount {
    return items.length;
  }

  static void addItem(Product product) {
    items.add(product);
  }

  static void removeItem(Product product) {
    items.remove(product);
  }

  static void clear() {
    items.clear();
  }
}