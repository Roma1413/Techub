import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart_manager.dart';

class Order {
  final Set<int> selectedSegment;
  final TimeOfDay? selectedTime;
  final DateTime? selectedDate;
  final String contactName;
  final String address;
  final List<CartItem> items;

  Order({
    required this.selectedSegment,
    required this.selectedTime,
    required this.selectedDate,
    required this.contactName,
    required this.address,
    required this.items,
  });

  String getFormattedSegment() {
    if (selectedSegment.contains(0)) return 'Delivery';
    if (selectedSegment.contains(1)) return 'Store Pickup';
    return 'Unknown';
  }

  String getFormattedTime() {
    if (selectedTime == null) return 'TBD';
    final h = selectedTime!.hour.toString().padLeft(2, '0');
    final m = selectedTime!.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String getFormattedDate() {
    if (selectedDate == null) return 'TBD';
    return DateFormat('MMM d, yyyy').format(selectedDate!);
  }

  String getFormattedOrderInfo() {
    final seg = getFormattedSegment();
    final name = contactName.isEmpty ? 'Unknown' : contactName;
    return '$name  •  ${getFormattedDate()}  •  ${getFormattedTime()}  •  $seg';
  }

  double get totalCost => items.fold(0.0, (sum, i) => sum + i.totalCost);
}

class OrderManager {
  final List<Order> _orders = [];

  List<Order> get orders => List.unmodifiable(_orders);

  void addOrder(Order order) => _orders.add(order);
  void removeOrder(Order order) => _orders.remove(order);

  int get totalOrders => _orders.length;
}
