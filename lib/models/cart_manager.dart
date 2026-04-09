class CartItem {
  final String id;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  double get totalCost => price * quantity;
}

enum DeliveryMode { delivery, pickup }

class CartManager {
  final List<CartItem> _items = [];
  DeliveryMode _mode = DeliveryMode.delivery;
  DateTime? _scheduledTime;

  void addItem(CartItem item) => _items.add(item);

  void removeItem(String id) => _items.removeWhere((item) => item.id == id);

  void resetCart() {
    _items.clear();
    _mode = DeliveryMode.delivery;
    _scheduledTime = null;
  }

  CartItem itemAt(int index) {
    if (index >= 0 && index < _items.length) return _items[index];
    throw IndexError.withLength(index, _items.length);
  }

  double get totalCost => _items.fold(0.0, (sum, item) => sum + item.totalCost);

  List<CartItem> get items => List.unmodifiable(_items);

  bool get isEmpty => _items.isEmpty;

  void setMode(DeliveryMode mode) => _mode = mode;
  DeliveryMode get mode => _mode;

  void setTime(DateTime time) => _scheduledTime = time;
  DateTime? get scheduledTime => _scheduledTime;
}
