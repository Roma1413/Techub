import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';

class MyOrdersPage extends StatelessWidget {
  final OrderManager orderManager;

  const MyOrdersPage({super.key, required this.orderManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TechColors.background,
      appBar: AppBar(
        backgroundColor: TechColors.background,
        title: const Text('My Orders', style: TextStyle(
          color: TechColors.textPrimary, fontSize: 22, fontWeight: FontWeight.w700)),
        centerTitle: false,
      ),
      body: orderManager.totalOrders == 0
          ? _buildEmpty()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: orderManager.totalOrders,
              itemBuilder: (context, index) =>
                  OrderTile(order: orderManager.orders[index]),
            ),
    );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, color: TechColors.textMuted, size: 64),
          SizedBox(height: 16),
          Text('No orders yet', style: TextStyle(
            color: TechColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text('Start shopping to see your orders here',
            style: TextStyle(color: TechColors.textSecondary, fontSize: 13)),
        ],
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final Order order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TechColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: TechColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: TechColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: TechColors.success.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6, height: 6,
                      decoration: const BoxDecoration(
                        color: TechColors.success, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 4),
                    const Text('Confirmed', style: TextStyle(
                      color: TechColors.success, fontSize: 10, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const Spacer(),
              Text('\$${order.totalCost.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: TechColors.accent, fontSize: 16, fontWeight: FontWeight.w800)),
            ],
          ),
          const SizedBox(height: 10),
          Text(order.getFormattedOrderInfo(),
            style: const TextStyle(color: TechColors.textSecondary, fontSize: 12)),
          const SizedBox(height: 10),
          const Divider(color: TechColors.border, height: 1),
          const SizedBox(height: 10),
          Text('${order.items.length} item${order.items.length == 1 ? '' : 's'}',
            style: const TextStyle(color: TechColors.textMuted, fontSize: 12)),
          const SizedBox(height: 4),
          ...order.items.take(3).map((item) => Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text('• ${item.name}  ×${item.quantity}',
              style: const TextStyle(color: TechColors.textSecondary, fontSize: 12)),
          )),
          if (order.items.length > 3)
            Text('+ ${order.items.length - 3} more',
              style: const TextStyle(color: TechColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }
}
