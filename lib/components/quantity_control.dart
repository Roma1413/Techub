import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';

class QuantityControl extends StatefulWidget {
  final Product product;
  final void Function(int quantity) addToCart;

  const QuantityControl({super.key, required this.product, required this.addToCart});

  @override
  State<QuantityControl> createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Quantity selector
        Container(
          decoration: BoxDecoration(
            color: TechColors.surfaceHigh,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: TechColors.border),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: TechColors.textSecondary, size: 18),
                onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
              ),
              Text('$_quantity', style: const TextStyle(
                color: TechColors.textPrimary, fontSize: 16, fontWeight: FontWeight.w700)),
              IconButton(
                icon: const Icon(Icons.add, color: TechColors.accent, size: 18),
                onPressed: () => setState(() => _quantity++),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        // Add to cart button
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => widget.addToCart(_quantity),
            icon: const Icon(Icons.shopping_cart_outlined, size: 18),
            label: Text('Add to Cart — \$${(widget.product.price * _quantity).toStringAsFixed(2)}'),
            style: ElevatedButton.styleFrom(
              backgroundColor: TechColors.accent,
              foregroundColor: TechColors.background,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }
}
