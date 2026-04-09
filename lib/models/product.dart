class ProductSpec {
  final String key;
  final String value;
  ProductSpec(this.key, this.value);
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final List<ProductSpec> specs;
  final bool inStock;
  final String badge; // e.g. 'NEW', 'HOT', 'SALE', ''

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.specs,
    this.inStock = true,
    this.badge = '',
  });

  bool get isOnSale => originalPrice > price;

  String getRatingAndReviews() => '${rating.toStringAsFixed(1)} ★  ($reviewCount reviews)';
}

class TechStore {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final double rating;
  final String category;
  final String deliveryTime;
  final double deliveryFee;
  final List<Product> products;
  final String attributes;

  TechStore({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.rating,
    required this.category,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.products,
    required this.attributes,
  });

  String getRatingAndDelivery() =>
      '${rating.toStringAsFixed(1)} ★  •  $deliveryTime  •  \$$deliveryFee delivery';
}

// ─── Mock Products ────────────────────────────────────────────────────────────

final _appleProducts = [
  Product(
    id: 'p1', name: 'iPhone 16 Pro', badge: 'NEW',
    description: '6.3-inch Super Retina XDR display, A18 Pro chip, 48MP camera system.',
    price: 999.00, originalPrice: 999.00,
    imageUrl: 'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?w=400',
    rating: 4.9, reviewCount: 2841,
    specs: [ProductSpec('Chip', 'A18 Pro'), ProductSpec('Storage', '256GB'), ProductSpec('Camera', '48MP')],
  ),
  Product(
    id: 'p2', name: 'MacBook Pro 14"', badge: 'HOT',
    description: 'M4 Pro chip, Liquid Retina XDR display, up to 24 hours battery.',
    price: 1999.00, originalPrice: 2199.00,
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
    rating: 4.8, reviewCount: 1204,
    specs: [ProductSpec('Chip', 'M4 Pro'), ProductSpec('RAM', '24GB'), ProductSpec('SSD', '512GB')],
  ),
  Product(
    id: 'p3', name: 'AirPods Pro 2',
    description: 'Active Noise Cancellation, Adaptive Transparency, Personalized Spatial Audio.',
    price: 249.00, originalPrice: 299.00,
    imageUrl: 'https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?w=400',
    rating: 4.7, reviewCount: 3912,
    specs: [ProductSpec('ANC', 'Yes'), ProductSpec('Battery', '30h case'), ProductSpec('Chip', 'H2')],
  ),
  Product(
    id: 'p4', name: 'Apple Watch Ultra 2',
    description: '49mm titanium case, up to 60h battery, precision dual-frequency GPS.',
    price: 799.00, originalPrice: 799.00,
    imageUrl: 'https://images.unsplash.com/photo-1551816230-ef5deaed4a26?w=400',
    rating: 4.6, reviewCount: 892,
    specs: [ProductSpec('Case', 'Titanium'), ProductSpec('GPS', 'Dual-freq'), ProductSpec('Water', '100m')],
  ),
];

final _samsungProducts = [
  Product(
    id: 'p5', name: 'Galaxy S25 Ultra', badge: 'NEW',
    description: 'Snapdragon 8 Elite, 200MP camera, built-in S Pen, 5000mAh battery.',
    price: 1299.00, originalPrice: 1299.00,
    imageUrl: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
    rating: 4.8, reviewCount: 1537,
    specs: [ProductSpec('Chip', 'SD 8 Elite'), ProductSpec('Camera', '200MP'), ProductSpec('Battery', '5000mAh')],
  ),
  Product(
    id: 'p6', name: 'Samsung 65" QLED 4K', badge: 'SALE',
    description: 'Quantum HDR, Neo Quantum Processor 4K, Object Tracking Sound.',
    price: 1199.00, originalPrice: 1799.00,
    imageUrl: 'https://images.unsplash.com/photo-1593359677879-a4bb92f4834e?w=400',
    rating: 4.7, reviewCount: 743,
    specs: [ProductSpec('Size', '65"'), ProductSpec('Resolution', '4K'), ProductSpec('HDR', 'Quantum HDR')],
  ),
  Product(
    id: 'p7', name: 'Galaxy Tab S10+',
    description: '12.4-inch Dynamic AMOLED 2X, S Pen included, IP68 water resistance.',
    price: 899.00, originalPrice: 999.00,
    imageUrl: 'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=400',
    rating: 4.5, reviewCount: 621,
    specs: [ProductSpec('Display', '12.4" AMOLED'), ProductSpec('Chip', 'SD 8 Gen 3'), ProductSpec('Storage', '256GB')],
  ),
  Product(
    id: 'p8', name: 'Galaxy Buds3 Pro', badge: 'HOT',
    description: 'Blade-type design, 360° Audio, ANC with 24-bit audio.',
    price: 249.00, originalPrice: 249.00,
    imageUrl: 'https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=400',
    rating: 4.4, reviewCount: 488,
    specs: [ProductSpec('ANC', 'Yes'), ProductSpec('Battery', '30h'), ProductSpec('Audio', '24-bit')],
  ),
];

final _sonyProducts = [
  Product(
    id: 'p9', name: 'PlayStation 5 Pro', badge: 'HOT',
    description: 'PlayStation Spectral Super Resolution, 45% faster GPU, 4K 120FPS gaming.',
    price: 699.00, originalPrice: 699.00,
    imageUrl: 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=400',
    rating: 4.9, reviewCount: 5204,
    specs: [ProductSpec('GPU', '45% faster'), ProductSpec('Storage', '2TB SSD'), ProductSpec('Output', '8K')],
  ),
  Product(
    id: 'p10', name: 'WH-1000XM6', badge: 'NEW',
    description: 'Industry-leading noise canceling, 40-hour battery, multipoint connection.',
    price: 399.00, originalPrice: 449.00,
    imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
    rating: 4.8, reviewCount: 2103,
    specs: [ProductSpec('ANC', 'Industry-leading'), ProductSpec('Battery', '40h'), ProductSpec('Codec', 'LDAC')],
  ),
  Product(
    id: 'p11', name: 'Alpha 7C II',
    description: 'Full-frame mirrorless, 33MP BSI sensor, AI-based autofocus.',
    price: 2199.00, originalPrice: 2199.00,
    imageUrl: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400',
    rating: 4.7, reviewCount: 312,
    specs: [ProductSpec('Sensor', '33MP Full-frame'), ProductSpec('AF', 'AI-based'), ProductSpec('Video', '4K 60fps')],
  ),
  Product(
    id: 'p12', name: 'Bravia 8 OLED 55"', badge: 'SALE',
    description: 'XR OLED Contrast Pro, Acoustic Surface Audio+, Google TV.',
    price: 1799.00, originalPrice: 2499.00,
    imageUrl: 'https://images.unsplash.com/photo-1593359677879-a4bb92f4834e?w=400',
    rating: 4.6, reviewCount: 441,
    specs: [ProductSpec('Panel', 'OLED'), ProductSpec('Size', '55"'), ProductSpec('OS', 'Google TV')],
  ),
];

// ─── Mock Stores ──────────────────────────────────────────────────────────────

final List<TechStore> techStores = [
  TechStore(
    id: 's1', name: 'Apple Premium Store',
    address: '1 Infinite Loop, Cupertino, CA',
    imageUrl: 'https://images.unsplash.com/photo-1491553895911-0055eca6402d?w=800',
    rating: 4.9, category: 'Apple Authorized',
    deliveryTime: '1-2 days', deliveryFee: 0.00,
    attributes: 'Official Apple Reseller  •  Free Returns  •  AppleCare+',
    products: _appleProducts,
  ),
  TechStore(
    id: 's2', name: 'Samsung Experience',
    address: '837 Washington St, New York, NY',
    imageUrl: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=800',
    rating: 4.7, category: 'Samsung Official',
    deliveryTime: '2-3 days', deliveryFee: 9.99,
    attributes: 'Official Samsung Store  •  Trade-In Program  •  Expert Staff',
    products: _samsungProducts,
  ),
  TechStore(
    id: 's3', name: 'Sony Tech World',
    address: '550 Madison Ave, New York, NY',
    imageUrl: 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=800',
    rating: 4.6, category: 'Sony Official',
    deliveryTime: '2-4 days', deliveryFee: 4.99,
    attributes: 'Official Sony Retailer  •  Gaming Hub  •  Audio Demos',
    products: _sonyProducts,
  ),
];
