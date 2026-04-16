import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../constants.dart';
import '../models/models.dart';
import 'quantity_control.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  final CartManager cartManager;
  final VoidCallback quantityUpdated;

  const ProductDetails({
    super.key,
    required this.product,
    required this.cartManager,
    required this.quantityUpdated,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // ---------------- ENTRY ANIMATION ----------------
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();

    // ---------------- COLOR LOOP ANIMATION ----------------
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.lightBlue, end: Colors.blue),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.indigo[900]),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.indigo[900], end: Colors.lightBlue),
        weight: 1,
      ),
    ]).animate(_colorController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: child,
          ),
        );
      },
      child: Container(
        color: TechColors.surface,
        padding: const EdgeInsets.all(20),
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle bar
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: TechColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                _buildHeader(),
                const SizedBox(height: 16),
                _buildImage(),
                const SizedBox(height: 16),
                _buildSpecs(),
                const SizedBox(height: 16),
                _buildDescription(),
                const SizedBox(height: 20),
                _buildAddToCart(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- ADD TO CART (ANIMATED) ----------------
  Widget _buildAddToCart() {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        final color = _colorAnimation.value ?? Colors.blue;
        return Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.6),
                blurRadius: 18,
                spreadRadius: 2,
              ),
            ],
          ),
          child: QuantityControl(
            product: widget.product,
            addToCart: (quantity) {
              const uuid = Uuid();

              final cartItem = CartItem(
                id: uuid.v4(),
                productId: widget.product.id,
                name: widget.product.name,
                price: widget.product.price,
                quantity: quantity,
                imageUrl: widget.product.imageUrl,
              );

              setState(() {
                widget.cartManager.addItem(cartItem);
                widget.quantityUpdated();
              });

              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  // ---------------- HEADER ----------------
  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.product.badge.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: TechColors.accent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: TechColors.accent.withOpacity(0.4),
                    ),
                  ),
                  child: Text(
                    widget.product.badge,
                    style: const TextStyle(
                      color: TechColors.accent,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
              ],
              Text(
                widget.product.name,
                style: const TextStyle(
                  color: TechColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.star_rounded,
                      color: TechColors.warning, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    widget.product.getRatingAndReviews(),
                    style: const TextStyle(
                      color: TechColors.textSecondary,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: TechColors.accent,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (widget.product.isOnSale)
              Text(
                '\$${widget.product.originalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: TechColors.textMuted,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),
      ],
    );
  }

  // ---------------- IMAGE ----------------
  Widget _buildImage() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: TechColors.surfaceHigh,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          widget.product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ---------------- SPECS ----------------
  Widget _buildSpecs() {
    if (widget.product.specs.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: TechColors.surfaceHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: TechColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Specs',
            style: TextStyle(
              color: TechColors.textSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.product.specs.map((spec) {
              return Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: TechColors.background,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: TechColors.border),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${spec.key}  ',
                        style: const TextStyle(
                          color: TechColors.textMuted,
                          fontSize: 11,
                        ),
                      ),
                      TextSpan(
                        text: spec.value,
                        style: const TextStyle(
                          color: TechColors.textPrimary,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ---------------- DESCRIPTION ----------------
  Widget _buildDescription() {
    return Text(
      widget.product.description,
      style: const TextStyle(
        color: TechColors.textSecondary,
        fontSize: 14,
        height: 1.5,
      ),
    );
  }
}