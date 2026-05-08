// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'techhub_db.dart';

// ignore_for_file: type=lint
class $DbStoreTable extends DbStore with TableInfo<$DbStoreTable, DbStoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deliveryTimeMeta =
      const VerificationMeta('deliveryTime');
  @override
  late final GeneratedColumn<String> deliveryTime = GeneratedColumn<String>(
      'delivery_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deliveryFeeMeta =
      const VerificationMeta('deliveryFee');
  @override
  late final GeneratedColumn<double> deliveryFee = GeneratedColumn<double>(
      'delivery_fee', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _attributesMeta =
      const VerificationMeta('attributes');
  @override
  late final GeneratedColumn<String> attributes = GeneratedColumn<String>(
      'attributes', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        address,
        imageUrl,
        rating,
        category,
        deliveryTime,
        deliveryFee,
        attributes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_store';
  @override
  VerificationContext validateIntegrity(Insertable<DbStoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('delivery_time')) {
      context.handle(
          _deliveryTimeMeta,
          deliveryTime.isAcceptableOrUnknown(
              data['delivery_time']!, _deliveryTimeMeta));
    } else if (isInserting) {
      context.missing(_deliveryTimeMeta);
    }
    if (data.containsKey('delivery_fee')) {
      context.handle(
          _deliveryFeeMeta,
          deliveryFee.isAcceptableOrUnknown(
              data['delivery_fee']!, _deliveryFeeMeta));
    } else if (isInserting) {
      context.missing(_deliveryFeeMeta);
    }
    if (data.containsKey('attributes')) {
      context.handle(
          _attributesMeta,
          attributes.isAcceptableOrUnknown(
              data['attributes']!, _attributesMeta));
    } else if (isInserting) {
      context.missing(_attributesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbStoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbStoreData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      deliveryTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}delivery_time'])!,
      deliveryFee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}delivery_fee'])!,
      attributes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attributes'])!,
    );
  }

  @override
  $DbStoreTable createAlias(String alias) {
    return $DbStoreTable(attachedDatabase, alias);
  }
}

class DbStoreData extends DataClass implements Insertable<DbStoreData> {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final double rating;
  final String category;
  final String deliveryTime;
  final double deliveryFee;
  final String attributes;
  const DbStoreData(
      {required this.id,
      required this.name,
      required this.address,
      required this.imageUrl,
      required this.rating,
      required this.category,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.attributes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['image_url'] = Variable<String>(imageUrl);
    map['rating'] = Variable<double>(rating);
    map['category'] = Variable<String>(category);
    map['delivery_time'] = Variable<String>(deliveryTime);
    map['delivery_fee'] = Variable<double>(deliveryFee);
    map['attributes'] = Variable<String>(attributes);
    return map;
  }

  DbStoreCompanion toCompanion(bool nullToAbsent) {
    return DbStoreCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      imageUrl: Value(imageUrl),
      rating: Value(rating),
      category: Value(category),
      deliveryTime: Value(deliveryTime),
      deliveryFee: Value(deliveryFee),
      attributes: Value(attributes),
    );
  }

  factory DbStoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbStoreData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      rating: serializer.fromJson<double>(json['rating']),
      category: serializer.fromJson<String>(json['category']),
      deliveryTime: serializer.fromJson<String>(json['deliveryTime']),
      deliveryFee: serializer.fromJson<double>(json['deliveryFee']),
      attributes: serializer.fromJson<String>(json['attributes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'rating': serializer.toJson<double>(rating),
      'category': serializer.toJson<String>(category),
      'deliveryTime': serializer.toJson<String>(deliveryTime),
      'deliveryFee': serializer.toJson<double>(deliveryFee),
      'attributes': serializer.toJson<String>(attributes),
    };
  }

  DbStoreData copyWith(
          {String? id,
          String? name,
          String? address,
          String? imageUrl,
          double? rating,
          String? category,
          String? deliveryTime,
          double? deliveryFee,
          String? attributes}) =>
      DbStoreData(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        imageUrl: imageUrl ?? this.imageUrl,
        rating: rating ?? this.rating,
        category: category ?? this.category,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        attributes: attributes ?? this.attributes,
      );
  DbStoreData copyWithCompanion(DbStoreCompanion data) {
    return DbStoreData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      rating: data.rating.present ? data.rating.value : this.rating,
      category: data.category.present ? data.category.value : this.category,
      deliveryTime: data.deliveryTime.present
          ? data.deliveryTime.value
          : this.deliveryTime,
      deliveryFee:
          data.deliveryFee.present ? data.deliveryFee.value : this.deliveryFee,
      attributes:
          data.attributes.present ? data.attributes.value : this.attributes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbStoreData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rating: $rating, ')
          ..write('category: $category, ')
          ..write('deliveryTime: $deliveryTime, ')
          ..write('deliveryFee: $deliveryFee, ')
          ..write('attributes: $attributes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, imageUrl, rating, category,
      deliveryTime, deliveryFee, attributes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbStoreData &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.imageUrl == this.imageUrl &&
          other.rating == this.rating &&
          other.category == this.category &&
          other.deliveryTime == this.deliveryTime &&
          other.deliveryFee == this.deliveryFee &&
          other.attributes == this.attributes);
}

class DbStoreCompanion extends UpdateCompanion<DbStoreData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> imageUrl;
  final Value<double> rating;
  final Value<String> category;
  final Value<String> deliveryTime;
  final Value<double> deliveryFee;
  final Value<String> attributes;
  final Value<int> rowid;
  const DbStoreCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rating = const Value.absent(),
    this.category = const Value.absent(),
    this.deliveryTime = const Value.absent(),
    this.deliveryFee = const Value.absent(),
    this.attributes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbStoreCompanion.insert({
    required String id,
    required String name,
    required String address,
    required String imageUrl,
    required double rating,
    required String category,
    required String deliveryTime,
    required double deliveryFee,
    required String attributes,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        address = Value(address),
        imageUrl = Value(imageUrl),
        rating = Value(rating),
        category = Value(category),
        deliveryTime = Value(deliveryTime),
        deliveryFee = Value(deliveryFee),
        attributes = Value(attributes);
  static Insertable<DbStoreData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? imageUrl,
    Expression<double>? rating,
    Expression<String>? category,
    Expression<String>? deliveryTime,
    Expression<double>? deliveryFee,
    Expression<String>? attributes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rating != null) 'rating': rating,
      if (category != null) 'category': category,
      if (deliveryTime != null) 'delivery_time': deliveryTime,
      if (deliveryFee != null) 'delivery_fee': deliveryFee,
      if (attributes != null) 'attributes': attributes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbStoreCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? address,
      Value<String>? imageUrl,
      Value<double>? rating,
      Value<String>? category,
      Value<String>? deliveryTime,
      Value<double>? deliveryFee,
      Value<String>? attributes,
      Value<int>? rowid}) {
    return DbStoreCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      category: category ?? this.category,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      attributes: attributes ?? this.attributes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (deliveryTime.present) {
      map['delivery_time'] = Variable<String>(deliveryTime.value);
    }
    if (deliveryFee.present) {
      map['delivery_fee'] = Variable<double>(deliveryFee.value);
    }
    if (attributes.present) {
      map['attributes'] = Variable<String>(attributes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbStoreCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rating: $rating, ')
          ..write('category: $category, ')
          ..write('deliveryTime: $deliveryTime, ')
          ..write('deliveryFee: $deliveryFee, ')
          ..write('attributes: $attributes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbProductTable extends DbProduct
    with TableInfo<$DbProductTable, DbProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _storeIdMeta =
      const VerificationMeta('storeId');
  @override
  late final GeneratedColumn<String> storeId = GeneratedColumn<String>(
      'store_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_store (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _originalPriceMeta =
      const VerificationMeta('originalPrice');
  @override
  late final GeneratedColumn<double> originalPrice = GeneratedColumn<double>(
      'original_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
      'rating', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _reviewCountMeta =
      const VerificationMeta('reviewCount');
  @override
  late final GeneratedColumn<int> reviewCount = GeneratedColumn<int>(
      'review_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _inStockMeta =
      const VerificationMeta('inStock');
  @override
  late final GeneratedColumn<bool> inStock = GeneratedColumn<bool>(
      'in_stock', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("in_stock" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _badgeMeta = const VerificationMeta('badge');
  @override
  late final GeneratedColumn<String> badge = GeneratedColumn<String>(
      'badge', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _bookmarkedMeta =
      const VerificationMeta('bookmarked');
  @override
  late final GeneratedColumn<bool> bookmarked = GeneratedColumn<bool>(
      'bookmarked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("bookmarked" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        storeId,
        name,
        description,
        price,
        originalPrice,
        imageUrl,
        rating,
        reviewCount,
        inStock,
        badge,
        bookmarked
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_product';
  @override
  VerificationContext validateIntegrity(Insertable<DbProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('store_id')) {
      context.handle(_storeIdMeta,
          storeId.isAcceptableOrUnknown(data['store_id']!, _storeIdMeta));
    } else if (isInserting) {
      context.missing(_storeIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('original_price')) {
      context.handle(
          _originalPriceMeta,
          originalPrice.isAcceptableOrUnknown(
              data['original_price']!, _originalPriceMeta));
    } else if (isInserting) {
      context.missing(_originalPriceMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('review_count')) {
      context.handle(
          _reviewCountMeta,
          reviewCount.isAcceptableOrUnknown(
              data['review_count']!, _reviewCountMeta));
    } else if (isInserting) {
      context.missing(_reviewCountMeta);
    }
    if (data.containsKey('in_stock')) {
      context.handle(_inStockMeta,
          inStock.isAcceptableOrUnknown(data['in_stock']!, _inStockMeta));
    }
    if (data.containsKey('badge')) {
      context.handle(
          _badgeMeta, badge.isAcceptableOrUnknown(data['badge']!, _badgeMeta));
    }
    if (data.containsKey('bookmarked')) {
      context.handle(
          _bookmarkedMeta,
          bookmarked.isAcceptableOrUnknown(
              data['bookmarked']!, _bookmarkedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbProductData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      storeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}store_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      originalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}original_price'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rating'])!,
      reviewCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}review_count'])!,
      inStock: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_stock'])!,
      badge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}badge'])!,
      bookmarked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bookmarked'])!,
    );
  }

  @override
  $DbProductTable createAlias(String alias) {
    return $DbProductTable(attachedDatabase, alias);
  }
}

class DbProductData extends DataClass implements Insertable<DbProductData> {
  final String id;
  final String storeId;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final bool inStock;
  final String badge;
  final bool bookmarked;
  const DbProductData(
      {required this.id,
      required this.storeId,
      required this.name,
      required this.description,
      required this.price,
      required this.originalPrice,
      required this.imageUrl,
      required this.rating,
      required this.reviewCount,
      required this.inStock,
      required this.badge,
      required this.bookmarked});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['store_id'] = Variable<String>(storeId);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['price'] = Variable<double>(price);
    map['original_price'] = Variable<double>(originalPrice);
    map['image_url'] = Variable<String>(imageUrl);
    map['rating'] = Variable<double>(rating);
    map['review_count'] = Variable<int>(reviewCount);
    map['in_stock'] = Variable<bool>(inStock);
    map['badge'] = Variable<String>(badge);
    map['bookmarked'] = Variable<bool>(bookmarked);
    return map;
  }

  DbProductCompanion toCompanion(bool nullToAbsent) {
    return DbProductCompanion(
      id: Value(id),
      storeId: Value(storeId),
      name: Value(name),
      description: Value(description),
      price: Value(price),
      originalPrice: Value(originalPrice),
      imageUrl: Value(imageUrl),
      rating: Value(rating),
      reviewCount: Value(reviewCount),
      inStock: Value(inStock),
      badge: Value(badge),
      bookmarked: Value(bookmarked),
    );
  }

  factory DbProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProductData(
      id: serializer.fromJson<String>(json['id']),
      storeId: serializer.fromJson<String>(json['storeId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<double>(json['price']),
      originalPrice: serializer.fromJson<double>(json['originalPrice']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      rating: serializer.fromJson<double>(json['rating']),
      reviewCount: serializer.fromJson<int>(json['reviewCount']),
      inStock: serializer.fromJson<bool>(json['inStock']),
      badge: serializer.fromJson<String>(json['badge']),
      bookmarked: serializer.fromJson<bool>(json['bookmarked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'storeId': serializer.toJson<String>(storeId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<double>(price),
      'originalPrice': serializer.toJson<double>(originalPrice),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'rating': serializer.toJson<double>(rating),
      'reviewCount': serializer.toJson<int>(reviewCount),
      'inStock': serializer.toJson<bool>(inStock),
      'badge': serializer.toJson<String>(badge),
      'bookmarked': serializer.toJson<bool>(bookmarked),
    };
  }

  DbProductData copyWith(
          {String? id,
          String? storeId,
          String? name,
          String? description,
          double? price,
          double? originalPrice,
          String? imageUrl,
          double? rating,
          int? reviewCount,
          bool? inStock,
          String? badge,
          bool? bookmarked}) =>
      DbProductData(
        id: id ?? this.id,
        storeId: storeId ?? this.storeId,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        originalPrice: originalPrice ?? this.originalPrice,
        imageUrl: imageUrl ?? this.imageUrl,
        rating: rating ?? this.rating,
        reviewCount: reviewCount ?? this.reviewCount,
        inStock: inStock ?? this.inStock,
        badge: badge ?? this.badge,
        bookmarked: bookmarked ?? this.bookmarked,
      );
  DbProductData copyWithCompanion(DbProductCompanion data) {
    return DbProductData(
      id: data.id.present ? data.id.value : this.id,
      storeId: data.storeId.present ? data.storeId.value : this.storeId,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      price: data.price.present ? data.price.value : this.price,
      originalPrice: data.originalPrice.present
          ? data.originalPrice.value
          : this.originalPrice,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewCount:
          data.reviewCount.present ? data.reviewCount.value : this.reviewCount,
      inStock: data.inStock.present ? data.inStock.value : this.inStock,
      badge: data.badge.present ? data.badge.value : this.badge,
      bookmarked:
          data.bookmarked.present ? data.bookmarked.value : this.bookmarked,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbProductData(')
          ..write('id: $id, ')
          ..write('storeId: $storeId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('inStock: $inStock, ')
          ..write('badge: $badge, ')
          ..write('bookmarked: $bookmarked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, storeId, name, description, price,
      originalPrice, imageUrl, rating, reviewCount, inStock, badge, bookmarked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProductData &&
          other.id == this.id &&
          other.storeId == this.storeId &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price &&
          other.originalPrice == this.originalPrice &&
          other.imageUrl == this.imageUrl &&
          other.rating == this.rating &&
          other.reviewCount == this.reviewCount &&
          other.inStock == this.inStock &&
          other.badge == this.badge &&
          other.bookmarked == this.bookmarked);
}

class DbProductCompanion extends UpdateCompanion<DbProductData> {
  final Value<String> id;
  final Value<String> storeId;
  final Value<String> name;
  final Value<String> description;
  final Value<double> price;
  final Value<double> originalPrice;
  final Value<String> imageUrl;
  final Value<double> rating;
  final Value<int> reviewCount;
  final Value<bool> inStock;
  final Value<String> badge;
  final Value<bool> bookmarked;
  final Value<int> rowid;
  const DbProductCompanion({
    this.id = const Value.absent(),
    this.storeId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.originalPrice = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewCount = const Value.absent(),
    this.inStock = const Value.absent(),
    this.badge = const Value.absent(),
    this.bookmarked = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbProductCompanion.insert({
    required String id,
    required String storeId,
    required String name,
    required String description,
    required double price,
    required double originalPrice,
    required String imageUrl,
    required double rating,
    required int reviewCount,
    this.inStock = const Value.absent(),
    this.badge = const Value.absent(),
    this.bookmarked = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        storeId = Value(storeId),
        name = Value(name),
        description = Value(description),
        price = Value(price),
        originalPrice = Value(originalPrice),
        imageUrl = Value(imageUrl),
        rating = Value(rating),
        reviewCount = Value(reviewCount);
  static Insertable<DbProductData> custom({
    Expression<String>? id,
    Expression<String>? storeId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? price,
    Expression<double>? originalPrice,
    Expression<String>? imageUrl,
    Expression<double>? rating,
    Expression<int>? reviewCount,
    Expression<bool>? inStock,
    Expression<String>? badge,
    Expression<bool>? bookmarked,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (storeId != null) 'store_id': storeId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (originalPrice != null) 'original_price': originalPrice,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rating != null) 'rating': rating,
      if (reviewCount != null) 'review_count': reviewCount,
      if (inStock != null) 'in_stock': inStock,
      if (badge != null) 'badge': badge,
      if (bookmarked != null) 'bookmarked': bookmarked,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbProductCompanion copyWith(
      {Value<String>? id,
      Value<String>? storeId,
      Value<String>? name,
      Value<String>? description,
      Value<double>? price,
      Value<double>? originalPrice,
      Value<String>? imageUrl,
      Value<double>? rating,
      Value<int>? reviewCount,
      Value<bool>? inStock,
      Value<String>? badge,
      Value<bool>? bookmarked,
      Value<int>? rowid}) {
    return DbProductCompanion(
      id: id ?? this.id,
      storeId: storeId ?? this.storeId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      inStock: inStock ?? this.inStock,
      badge: badge ?? this.badge,
      bookmarked: bookmarked ?? this.bookmarked,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (storeId.present) {
      map['store_id'] = Variable<String>(storeId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (originalPrice.present) {
      map['original_price'] = Variable<double>(originalPrice.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (reviewCount.present) {
      map['review_count'] = Variable<int>(reviewCount.value);
    }
    if (inStock.present) {
      map['in_stock'] = Variable<bool>(inStock.value);
    }
    if (badge.present) {
      map['badge'] = Variable<String>(badge.value);
    }
    if (bookmarked.present) {
      map['bookmarked'] = Variable<bool>(bookmarked.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbProductCompanion(')
          ..write('id: $id, ')
          ..write('storeId: $storeId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('originalPrice: $originalPrice, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rating: $rating, ')
          ..write('reviewCount: $reviewCount, ')
          ..write('inStock: $inStock, ')
          ..write('badge: $badge, ')
          ..write('bookmarked: $bookmarked, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbProductSpecTable extends DbProductSpec
    with TableInfo<$DbProductSpecTable, DbProductSpecData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbProductSpecTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_product (id)'));
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, productId, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_product_spec';
  @override
  VerificationContext validateIntegrity(Insertable<DbProductSpecData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbProductSpecData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbProductSpecData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $DbProductSpecTable createAlias(String alias) {
    return $DbProductSpecTable(attachedDatabase, alias);
  }
}

class DbProductSpecData extends DataClass
    implements Insertable<DbProductSpecData> {
  final int id;
  final String productId;
  final String key;
  final String value;
  const DbProductSpecData(
      {required this.id,
      required this.productId,
      required this.key,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<String>(productId);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  DbProductSpecCompanion toCompanion(bool nullToAbsent) {
    return DbProductSpecCompanion(
      id: Value(id),
      productId: Value(productId),
      key: Value(key),
      value: Value(value),
    );
  }

  factory DbProductSpecData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbProductSpecData(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<String>(productId),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  DbProductSpecData copyWith(
          {int? id, String? productId, String? key, String? value}) =>
      DbProductSpecData(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        key: key ?? this.key,
        value: value ?? this.value,
      );
  DbProductSpecData copyWithCompanion(DbProductSpecCompanion data) {
    return DbProductSpecData(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbProductSpecData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbProductSpecData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.key == this.key &&
          other.value == this.value);
}

class DbProductSpecCompanion extends UpdateCompanion<DbProductSpecData> {
  final Value<int> id;
  final Value<String> productId;
  final Value<String> key;
  final Value<String> value;
  const DbProductSpecCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  DbProductSpecCompanion.insert({
    this.id = const Value.absent(),
    required String productId,
    required String key,
    required String value,
  })  : productId = Value(productId),
        key = Value(key),
        value = Value(value);
  static Insertable<DbProductSpecData> custom({
    Expression<int>? id,
    Expression<String>? productId,
    Expression<String>? key,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  DbProductSpecCompanion copyWith(
      {Value<int>? id,
      Value<String>? productId,
      Value<String>? key,
      Value<String>? value}) {
    return DbProductSpecCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbProductSpecCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $DbCartItemTable extends DbCartItem
    with TableInfo<$DbCartItemTable, DbCartItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbCartItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, name, price, quantity, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_cart_item';
  @override
  VerificationContext validateIntegrity(Insertable<DbCartItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbCartItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCartItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
    );
  }

  @override
  $DbCartItemTable createAlias(String alias) {
    return $DbCartItemTable(attachedDatabase, alias);
  }
}

class DbCartItemData extends DataClass implements Insertable<DbCartItemData> {
  final String id;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  const DbCartItemData(
      {required this.id,
      required this.productId,
      required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<int>(quantity);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  DbCartItemCompanion toCompanion(bool nullToAbsent) {
    return DbCartItemCompanion(
      id: Value(id),
      productId: Value(productId),
      name: Value(name),
      price: Value(price),
      quantity: Value(quantity),
      imageUrl: Value(imageUrl),
    );
  }

  factory DbCartItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCartItemData(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<int>(quantity),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  DbCartItemData copyWith(
          {String? id,
          String? productId,
          String? name,
          double? price,
          int? quantity,
          String? imageUrl}) =>
      DbCartItemData(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        imageUrl: imageUrl ?? this.imageUrl,
      );
  DbCartItemData copyWithCompanion(DbCartItemCompanion data) {
    return DbCartItemData(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbCartItemData(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, name, price, quantity, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCartItemData &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.imageUrl == this.imageUrl);
}

class DbCartItemCompanion extends UpdateCompanion<DbCartItemData> {
  final Value<String> id;
  final Value<String> productId;
  final Value<String> name;
  final Value<double> price;
  final Value<int> quantity;
  final Value<String> imageUrl;
  final Value<int> rowid;
  const DbCartItemCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DbCartItemCompanion.insert({
    required String id,
    required String productId,
    required String name,
    required double price,
    required int quantity,
    required String imageUrl,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        name = Value(name),
        price = Value(price),
        quantity = Value(quantity),
        imageUrl = Value(imageUrl);
  static Insertable<DbCartItemData> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? name,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DbCartItemCompanion copyWith(
      {Value<String>? id,
      Value<String>? productId,
      Value<String>? name,
      Value<double>? price,
      Value<int>? quantity,
      Value<String>? imageUrl,
      Value<int>? rowid}) {
    return DbCartItemCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbCartItemCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DbOrderTable extends DbOrder with TableInfo<$DbOrderTable, DbOrderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbOrderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contactNameMeta =
      const VerificationMeta('contactName');
  @override
  late final GeneratedColumn<String> contactName = GeneratedColumn<String>(
      'contact_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deliveryTypeMeta =
      const VerificationMeta('deliveryType');
  @override
  late final GeneratedColumn<String> deliveryType = GeneratedColumn<String>(
      'delivery_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledDateMeta =
      const VerificationMeta('scheduledDate');
  @override
  late final GeneratedColumn<String> scheduledDate = GeneratedColumn<String>(
      'scheduled_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scheduledTimeMeta =
      const VerificationMeta('scheduledTime');
  @override
  late final GeneratedColumn<String> scheduledTime = GeneratedColumn<String>(
      'scheduled_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalCostMeta =
      const VerificationMeta('totalCost');
  @override
  late final GeneratedColumn<double> totalCost = GeneratedColumn<double>(
      'total_cost', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        contactName,
        address,
        deliveryType,
        scheduledDate,
        scheduledTime,
        totalCost
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_order';
  @override
  VerificationContext validateIntegrity(Insertable<DbOrderData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('contact_name')) {
      context.handle(
          _contactNameMeta,
          contactName.isAcceptableOrUnknown(
              data['contact_name']!, _contactNameMeta));
    } else if (isInserting) {
      context.missing(_contactNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('delivery_type')) {
      context.handle(
          _deliveryTypeMeta,
          deliveryType.isAcceptableOrUnknown(
              data['delivery_type']!, _deliveryTypeMeta));
    } else if (isInserting) {
      context.missing(_deliveryTypeMeta);
    }
    if (data.containsKey('scheduled_date')) {
      context.handle(
          _scheduledDateMeta,
          scheduledDate.isAcceptableOrUnknown(
              data['scheduled_date']!, _scheduledDateMeta));
    } else if (isInserting) {
      context.missing(_scheduledDateMeta);
    }
    if (data.containsKey('scheduled_time')) {
      context.handle(
          _scheduledTimeMeta,
          scheduledTime.isAcceptableOrUnknown(
              data['scheduled_time']!, _scheduledTimeMeta));
    } else if (isInserting) {
      context.missing(_scheduledTimeMeta);
    }
    if (data.containsKey('total_cost')) {
      context.handle(_totalCostMeta,
          totalCost.isAcceptableOrUnknown(data['total_cost']!, _totalCostMeta));
    } else if (isInserting) {
      context.missing(_totalCostMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbOrderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbOrderData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      contactName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      deliveryType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}delivery_type'])!,
      scheduledDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scheduled_date'])!,
      scheduledTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scheduled_time'])!,
      totalCost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_cost'])!,
    );
  }

  @override
  $DbOrderTable createAlias(String alias) {
    return $DbOrderTable(attachedDatabase, alias);
  }
}

class DbOrderData extends DataClass implements Insertable<DbOrderData> {
  final int id;
  final String contactName;
  final String address;
  final String deliveryType;
  final String scheduledDate;
  final String scheduledTime;
  final double totalCost;
  const DbOrderData(
      {required this.id,
      required this.contactName,
      required this.address,
      required this.deliveryType,
      required this.scheduledDate,
      required this.scheduledTime,
      required this.totalCost});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['contact_name'] = Variable<String>(contactName);
    map['address'] = Variable<String>(address);
    map['delivery_type'] = Variable<String>(deliveryType);
    map['scheduled_date'] = Variable<String>(scheduledDate);
    map['scheduled_time'] = Variable<String>(scheduledTime);
    map['total_cost'] = Variable<double>(totalCost);
    return map;
  }

  DbOrderCompanion toCompanion(bool nullToAbsent) {
    return DbOrderCompanion(
      id: Value(id),
      contactName: Value(contactName),
      address: Value(address),
      deliveryType: Value(deliveryType),
      scheduledDate: Value(scheduledDate),
      scheduledTime: Value(scheduledTime),
      totalCost: Value(totalCost),
    );
  }

  factory DbOrderData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbOrderData(
      id: serializer.fromJson<int>(json['id']),
      contactName: serializer.fromJson<String>(json['contactName']),
      address: serializer.fromJson<String>(json['address']),
      deliveryType: serializer.fromJson<String>(json['deliveryType']),
      scheduledDate: serializer.fromJson<String>(json['scheduledDate']),
      scheduledTime: serializer.fromJson<String>(json['scheduledTime']),
      totalCost: serializer.fromJson<double>(json['totalCost']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contactName': serializer.toJson<String>(contactName),
      'address': serializer.toJson<String>(address),
      'deliveryType': serializer.toJson<String>(deliveryType),
      'scheduledDate': serializer.toJson<String>(scheduledDate),
      'scheduledTime': serializer.toJson<String>(scheduledTime),
      'totalCost': serializer.toJson<double>(totalCost),
    };
  }

  DbOrderData copyWith(
          {int? id,
          String? contactName,
          String? address,
          String? deliveryType,
          String? scheduledDate,
          String? scheduledTime,
          double? totalCost}) =>
      DbOrderData(
        id: id ?? this.id,
        contactName: contactName ?? this.contactName,
        address: address ?? this.address,
        deliveryType: deliveryType ?? this.deliveryType,
        scheduledDate: scheduledDate ?? this.scheduledDate,
        scheduledTime: scheduledTime ?? this.scheduledTime,
        totalCost: totalCost ?? this.totalCost,
      );
  DbOrderData copyWithCompanion(DbOrderCompanion data) {
    return DbOrderData(
      id: data.id.present ? data.id.value : this.id,
      contactName:
          data.contactName.present ? data.contactName.value : this.contactName,
      address: data.address.present ? data.address.value : this.address,
      deliveryType: data.deliveryType.present
          ? data.deliveryType.value
          : this.deliveryType,
      scheduledDate: data.scheduledDate.present
          ? data.scheduledDate.value
          : this.scheduledDate,
      scheduledTime: data.scheduledTime.present
          ? data.scheduledTime.value
          : this.scheduledTime,
      totalCost: data.totalCost.present ? data.totalCost.value : this.totalCost,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbOrderData(')
          ..write('id: $id, ')
          ..write('contactName: $contactName, ')
          ..write('address: $address, ')
          ..write('deliveryType: $deliveryType, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('totalCost: $totalCost')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, contactName, address, deliveryType,
      scheduledDate, scheduledTime, totalCost);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbOrderData &&
          other.id == this.id &&
          other.contactName == this.contactName &&
          other.address == this.address &&
          other.deliveryType == this.deliveryType &&
          other.scheduledDate == this.scheduledDate &&
          other.scheduledTime == this.scheduledTime &&
          other.totalCost == this.totalCost);
}

class DbOrderCompanion extends UpdateCompanion<DbOrderData> {
  final Value<int> id;
  final Value<String> contactName;
  final Value<String> address;
  final Value<String> deliveryType;
  final Value<String> scheduledDate;
  final Value<String> scheduledTime;
  final Value<double> totalCost;
  const DbOrderCompanion({
    this.id = const Value.absent(),
    this.contactName = const Value.absent(),
    this.address = const Value.absent(),
    this.deliveryType = const Value.absent(),
    this.scheduledDate = const Value.absent(),
    this.scheduledTime = const Value.absent(),
    this.totalCost = const Value.absent(),
  });
  DbOrderCompanion.insert({
    this.id = const Value.absent(),
    required String contactName,
    required String address,
    required String deliveryType,
    required String scheduledDate,
    required String scheduledTime,
    required double totalCost,
  })  : contactName = Value(contactName),
        address = Value(address),
        deliveryType = Value(deliveryType),
        scheduledDate = Value(scheduledDate),
        scheduledTime = Value(scheduledTime),
        totalCost = Value(totalCost);
  static Insertable<DbOrderData> custom({
    Expression<int>? id,
    Expression<String>? contactName,
    Expression<String>? address,
    Expression<String>? deliveryType,
    Expression<String>? scheduledDate,
    Expression<String>? scheduledTime,
    Expression<double>? totalCost,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contactName != null) 'contact_name': contactName,
      if (address != null) 'address': address,
      if (deliveryType != null) 'delivery_type': deliveryType,
      if (scheduledDate != null) 'scheduled_date': scheduledDate,
      if (scheduledTime != null) 'scheduled_time': scheduledTime,
      if (totalCost != null) 'total_cost': totalCost,
    });
  }

  DbOrderCompanion copyWith(
      {Value<int>? id,
      Value<String>? contactName,
      Value<String>? address,
      Value<String>? deliveryType,
      Value<String>? scheduledDate,
      Value<String>? scheduledTime,
      Value<double>? totalCost}) {
    return DbOrderCompanion(
      id: id ?? this.id,
      contactName: contactName ?? this.contactName,
      address: address ?? this.address,
      deliveryType: deliveryType ?? this.deliveryType,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      totalCost: totalCost ?? this.totalCost,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contactName.present) {
      map['contact_name'] = Variable<String>(contactName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (deliveryType.present) {
      map['delivery_type'] = Variable<String>(deliveryType.value);
    }
    if (scheduledDate.present) {
      map['scheduled_date'] = Variable<String>(scheduledDate.value);
    }
    if (scheduledTime.present) {
      map['scheduled_time'] = Variable<String>(scheduledTime.value);
    }
    if (totalCost.present) {
      map['total_cost'] = Variable<double>(totalCost.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbOrderCompanion(')
          ..write('id: $id, ')
          ..write('contactName: $contactName, ')
          ..write('address: $address, ')
          ..write('deliveryType: $deliveryType, ')
          ..write('scheduledDate: $scheduledDate, ')
          ..write('scheduledTime: $scheduledTime, ')
          ..write('totalCost: $totalCost')
          ..write(')'))
        .toString();
  }
}

class $DbOrderItemTable extends DbOrderItem
    with TableInfo<$DbOrderItemTable, DbOrderItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbOrderItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_order (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, orderId, productId, name, price, quantity, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_order_item';
  @override
  VerificationContext validateIntegrity(Insertable<DbOrderItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbOrderItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbOrderItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
    );
  }

  @override
  $DbOrderItemTable createAlias(String alias) {
    return $DbOrderItemTable(attachedDatabase, alias);
  }
}

class DbOrderItemData extends DataClass implements Insertable<DbOrderItemData> {
  final int id;
  final int orderId;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  const DbOrderItemData(
      {required this.id,
      required this.orderId,
      required this.productId,
      required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['product_id'] = Variable<String>(productId);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<int>(quantity);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  DbOrderItemCompanion toCompanion(bool nullToAbsent) {
    return DbOrderItemCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      name: Value(name),
      price: Value(price),
      quantity: Value(quantity),
      imageUrl: Value(imageUrl),
    );
  }

  factory DbOrderItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbOrderItemData(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      productId: serializer.fromJson<String>(json['productId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'productId': serializer.toJson<String>(productId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<int>(quantity),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  DbOrderItemData copyWith(
          {int? id,
          int? orderId,
          String? productId,
          String? name,
          double? price,
          int? quantity,
          String? imageUrl}) =>
      DbOrderItemData(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        productId: productId ?? this.productId,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        imageUrl: imageUrl ?? this.imageUrl,
      );
  DbOrderItemData copyWithCompanion(DbOrderItemCompanion data) {
    return DbOrderItemData(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbOrderItemData(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, orderId, productId, name, price, quantity, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbOrderItemData &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.productId == this.productId &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.imageUrl == this.imageUrl);
}

class DbOrderItemCompanion extends UpdateCompanion<DbOrderItemData> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<String> productId;
  final Value<String> name;
  final Value<double> price;
  final Value<int> quantity;
  final Value<String> imageUrl;
  const DbOrderItemCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  DbOrderItemCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required String productId,
    required String name,
    required double price,
    required int quantity,
    required String imageUrl,
  })  : orderId = Value(orderId),
        productId = Value(productId),
        name = Value(name),
        price = Value(price),
        quantity = Value(quantity),
        imageUrl = Value(imageUrl);
  static Insertable<DbOrderItemData> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<String>? productId,
    Expression<String>? name,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  DbOrderItemCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderId,
      Value<String>? productId,
      Value<String>? name,
      Value<double>? price,
      Value<int>? quantity,
      Value<String>? imageUrl}) {
    return DbOrderItemCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbOrderItemCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $DbSearchHistoryTable extends DbSearchHistory
    with TableInfo<$DbSearchHistoryTable, DbSearchHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSearchHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _searchedAtMeta =
      const VerificationMeta('searchedAt');
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
      'searched_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, query, searchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_search_history';
  @override
  VerificationContext validateIntegrity(
      Insertable<DbSearchHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('searched_at')) {
      context.handle(
          _searchedAtMeta,
          searchedAt.isAcceptableOrUnknown(
              data['searched_at']!, _searchedAtMeta));
    } else if (isInserting) {
      context.missing(_searchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSearchHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbSearchHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      searchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}searched_at'])!,
    );
  }

  @override
  $DbSearchHistoryTable createAlias(String alias) {
    return $DbSearchHistoryTable(attachedDatabase, alias);
  }
}

class DbSearchHistoryData extends DataClass
    implements Insertable<DbSearchHistoryData> {
  final int id;
  final String query;
  final DateTime searchedAt;
  const DbSearchHistoryData(
      {required this.id, required this.query, required this.searchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['query'] = Variable<String>(query);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  DbSearchHistoryCompanion toCompanion(bool nullToAbsent) {
    return DbSearchHistoryCompanion(
      id: Value(id),
      query: Value(query),
      searchedAt: Value(searchedAt),
    );
  }

  factory DbSearchHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSearchHistoryData(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  DbSearchHistoryData copyWith(
          {int? id, String? query, DateTime? searchedAt}) =>
      DbSearchHistoryData(
        id: id ?? this.id,
        query: query ?? this.query,
        searchedAt: searchedAt ?? this.searchedAt,
      );
  DbSearchHistoryData copyWithCompanion(DbSearchHistoryCompanion data) {
    return DbSearchHistoryData(
      id: data.id.present ? data.id.value : this.id,
      query: data.query.present ? data.query.value : this.query,
      searchedAt:
          data.searchedAt.present ? data.searchedAt.value : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbSearchHistoryData(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, query, searchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSearchHistoryData &&
          other.id == this.id &&
          other.query == this.query &&
          other.searchedAt == this.searchedAt);
}

class DbSearchHistoryCompanion extends UpdateCompanion<DbSearchHistoryData> {
  final Value<int> id;
  final Value<String> query;
  final Value<DateTime> searchedAt;
  const DbSearchHistoryCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.searchedAt = const Value.absent(),
  });
  DbSearchHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String query,
    required DateTime searchedAt,
  })  : query = Value(query),
        searchedAt = Value(searchedAt);
  static Insertable<DbSearchHistoryData> custom({
    Expression<int>? id,
    Expression<String>? query,
    Expression<DateTime>? searchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (searchedAt != null) 'searched_at': searchedAt,
    });
  }

  DbSearchHistoryCompanion copyWith(
      {Value<int>? id, Value<String>? query, Value<DateTime>? searchedAt}) {
    return DbSearchHistoryCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      searchedAt: searchedAt ?? this.searchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbSearchHistoryCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$TechHubDatabase extends GeneratedDatabase {
  _$TechHubDatabase(QueryExecutor e) : super(e);
  $TechHubDatabaseManager get managers => $TechHubDatabaseManager(this);
  late final $DbStoreTable dbStore = $DbStoreTable(this);
  late final $DbProductTable dbProduct = $DbProductTable(this);
  late final $DbProductSpecTable dbProductSpec = $DbProductSpecTable(this);
  late final $DbCartItemTable dbCartItem = $DbCartItemTable(this);
  late final $DbOrderTable dbOrder = $DbOrderTable(this);
  late final $DbOrderItemTable dbOrderItem = $DbOrderItemTable(this);
  late final $DbSearchHistoryTable dbSearchHistory =
      $DbSearchHistoryTable(this);
  late final StoreDao storeDao = StoreDao(this as TechHubDatabase);
  late final ProductDao productDao = ProductDao(this as TechHubDatabase);
  late final CartDao cartDao = CartDao(this as TechHubDatabase);
  late final OrderDao orderDao = OrderDao(this as TechHubDatabase);
  late final SearchHistoryDao searchHistoryDao =
      SearchHistoryDao(this as TechHubDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dbStore,
        dbProduct,
        dbProductSpec,
        dbCartItem,
        dbOrder,
        dbOrderItem,
        dbSearchHistory
      ];
}

typedef $$DbStoreTableCreateCompanionBuilder = DbStoreCompanion Function({
  required String id,
  required String name,
  required String address,
  required String imageUrl,
  required double rating,
  required String category,
  required String deliveryTime,
  required double deliveryFee,
  required String attributes,
  Value<int> rowid,
});
typedef $$DbStoreTableUpdateCompanionBuilder = DbStoreCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> address,
  Value<String> imageUrl,
  Value<double> rating,
  Value<String> category,
  Value<String> deliveryTime,
  Value<double> deliveryFee,
  Value<String> attributes,
  Value<int> rowid,
});

final class $$DbStoreTableReferences
    extends BaseReferences<_$TechHubDatabase, $DbStoreTable, DbStoreData> {
  $$DbStoreTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbProductTable, List<DbProductData>>
      _dbProductRefsTable(_$TechHubDatabase db) =>
          MultiTypedResultKey.fromTable(db.dbProduct,
              aliasName:
                  $_aliasNameGenerator(db.dbStore.id, db.dbProduct.storeId));

  $$DbProductTableProcessedTableManager get dbProductRefs {
    final manager = $$DbProductTableTableManager($_db, $_db.dbProduct)
        .filter((f) => f.storeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbProductRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DbStoreTableFilterComposer
    extends Composer<_$TechHubDatabase, $DbStoreTable> {
  $$DbStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deliveryTime => $composableBuilder(
      column: $table.deliveryTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get deliveryFee => $composableBuilder(
      column: $table.deliveryFee, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attributes => $composableBuilder(
      column: $table.attributes, builder: (column) => ColumnFilters(column));

  Expression<bool> dbProductRefs(
      Expression<bool> Function($$DbProductTableFilterComposer f) f) {
    final $$DbProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dbProduct,
        getReferencedColumn: (t) => t.storeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbProductTableFilterComposer(
              $db: $db,
              $table: $db.dbProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DbStoreTableOrderingComposer
    extends Composer<_$TechHubDatabase, $DbStoreTable> {
  $$DbStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deliveryTime => $composableBuilder(
      column: $table.deliveryTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get deliveryFee => $composableBuilder(
      column: $table.deliveryFee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attributes => $composableBuilder(
      column: $table.attributes, builder: (column) => ColumnOrderings(column));
}

class $$DbStoreTableAnnotationComposer
    extends Composer<_$TechHubDatabase, $DbStoreTable> {
  $$DbStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get deliveryTime => $composableBuilder(
      column: $table.deliveryTime, builder: (column) => column);

  GeneratedColumn<double> get deliveryFee => $composableBuilder(
      column: $table.deliveryFee, builder: (column) => column);

  GeneratedColumn<String> get attributes => $composableBuilder(
      column: $table.attributes, builder: (column) => column);

  Expression<T> dbProductRefs<T extends Object>(
      Expression<T> Function($$DbProductTableAnnotationComposer a) f) {
    final $$DbProductTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dbProduct,
        getReferencedColumn: (t) => t.storeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbProductTableAnnotationComposer(
              $db: $db,
              $table: $db.dbProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DbStoreTableTableManager extends RootTableManager<
    _$TechHubDatabase,
    $DbStoreTable,
    DbStoreData,
    $$DbStoreTableFilterComposer,
    $$DbStoreTableOrderingComposer,
    $$DbStoreTableAnnotationComposer,
    $$DbStoreTableCreateCompanionBuilder,
    $$DbStoreTableUpdateCompanionBuilder,
    (DbStoreData, $$DbStoreTableReferences),
    DbStoreData,
    PrefetchHooks Function({bool dbProductRefs})> {
  $$DbStoreTableTableManager(_$TechHubDatabase db, $DbStoreTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<double> rating = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> deliveryTime = const Value.absent(),
            Value<double> deliveryFee = const Value.absent(),
            Value<String> attributes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DbStoreCompanion(
            id: id,
            name: name,
            address: address,
            imageUrl: imageUrl,
            rating: rating,
            category: category,
            deliveryTime: deliveryTime,
            deliveryFee: deliveryFee,
            attributes: attributes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String address,
            required String imageUrl,
            required double rating,
            required String category,
            required String deliveryTime,
            required double deliveryFee,
            required String attributes,
            Value<int> rowid = const Value.absent(),
          }) =>
              DbStoreCompanion.insert(
            id: id,
            name: name,
            address: address,
            imageUrl: imageUrl,
            rating: rating,
            category: category,
            deliveryTime: deliveryTime,
            deliveryFee: deliveryFee,
            attributes: attributes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DbStoreTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({dbProductRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dbProductRefs) db.dbProduct],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbProductRefs)
                    await $_getPrefetchedData<DbStoreData, $DbStoreTable,
                            DbProductData>(
                        currentTable: table,
                        referencedTable:
                            $$DbStoreTableReferences._dbProductRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DbStoreTableReferences(db, table, p0)
                                .dbProductRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.storeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DbStoreTableProcessedTableManager = ProcessedTableManager<
    _$TechHubDatabase,
    $DbStoreTable,
    DbStoreData,
    $$DbStoreTableFilterComposer,
    $$DbStoreTableOrderingComposer,
    $$DbStoreTableAnnotationComposer,
    $$DbStoreTableCreateCompanionBuilder,
    $$DbStoreTableUpdateCompanionBuilder,
    (DbStoreData, $$DbStoreTableReferences),
    DbStoreData,
    PrefetchHooks Function({bool dbProductRefs})>;
typedef $$DbProductTableCreateCompanionBuilder = DbProductCompanion Function({
  required String id,
  required String storeId,
  required String name,
  required String description,
  required double price,
  required double originalPrice,
  required String imageUrl,
  required double rating,
  required int reviewCount,
  Value<bool> inStock,
  Value<String> badge,
  Value<bool> bookmarked,
  Value<int> rowid,
});
typedef $$DbProductTableUpdateCompanionBuilder = DbProductCompanion Function({
  Value<String> id,
  Value<String> storeId,
  Value<String> name,
  Value<String> description,
  Value<double> price,
  Value<double> originalPrice,
  Value<String> imageUrl,
  Value<double> rating,
  Value<int> reviewCount,
  Value<bool> inStock,
  Value<String> badge,
  Value<bool> bookmarked,
  Value<int> rowid,
});

final class $$DbProductTableReferences
    extends BaseReferences<_$TechHubDatabase, $DbProductTable, DbProductData> {
  $$DbProductTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbStoreTable _storeIdTable(_$TechHubDatabase db) => db.dbStore
      .createAlias($_aliasNameGenerator(db.dbProduct.storeId, db.dbStore.id));

  $$DbStoreTableProcessedTableManager get storeId {
    final $_column = $_itemColumn<String>('store_id')!;

    final manager = $$DbStoreTableTableManager($_db, $_db.dbStore)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_storeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$DbProductSpecTable, List<DbProductSpecData>>
      _dbProductSpecRefsTable(_$TechHubDatabase db) =>
          MultiTypedResultKey.fromTable(db.dbProductSpec,
              aliasName: $_aliasNameGenerator(
                  db.dbProduct.id, db.dbProductSpec.productId));

  $$DbProductSpecTableProcessedTableManager get dbProductSpecRefs {
    final manager = $$DbProductSpecTableTableManager($_db, $_db.dbProductSpec)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbProductSpecRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DbProductTableFilterComposer
    extends Composer<_$TechHubDatabase, $DbProductTable> {
  $$DbProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get originalPrice => $composableBuilder(
      column: $table.originalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reviewCount => $composableBuilder(
      column: $table.reviewCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get inStock => $composableBuilder(
      column: $table.inStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get badge => $composableBuilder(
      column: $table.badge, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => ColumnFilters(column));

  $$DbStoreTableFilterComposer get storeId {
    final $$DbStoreTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storeId,
        referencedTable: $db.dbStore,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbStoreTableFilterComposer(
              $db: $db,
              $table: $db.dbStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> dbProductSpecRefs(
      Expression<bool> Function($$DbProductSpecTableFilterComposer f) f) {
    final $$DbProductSpecTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dbProductSpec,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbProductSpecTableFilterComposer(
              $db: $db,
              $table: $db.dbProductSpec,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DbProductTableOrderingComposer
    extends Composer<_$TechHubDatabase, $DbProductTable> {
  $$DbProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get originalPrice => $composableBuilder(
      column: $table.originalPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reviewCount => $composableBuilder(
      column: $table.reviewCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get inStock => $composableBuilder(
      column: $table.inStock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get badge => $composableBuilder(
      column: $table.badge, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => ColumnOrderings(column));

  $$DbStoreTableOrderingComposer get storeId {
    final $$DbStoreTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storeId,
        referencedTable: $db.dbStore,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbStoreTableOrderingComposer(
              $db: $db,
              $table: $db.dbStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DbProductTableAnnotationComposer
    extends Composer<_$TechHubDatabase, $DbProductTable> {
  $$DbProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get originalPrice => $composableBuilder(
      column: $table.originalPrice, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get reviewCount => $composableBuilder(
      column: $table.reviewCount, builder: (column) => column);

  GeneratedColumn<bool> get inStock =>
      $composableBuilder(column: $table.inStock, builder: (column) => column);

  GeneratedColumn<String> get badge =>
      $composableBuilder(column: $table.badge, builder: (column) => column);

  GeneratedColumn<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => column);

  $$DbStoreTableAnnotationComposer get storeId {
    final $$DbStoreTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.storeId,
        referencedTable: $db.dbStore,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbStoreTableAnnotationComposer(
              $db: $db,
              $table: $db.dbStore,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> dbProductSpecRefs<T extends Object>(
      Expression<T> Function($$DbProductSpecTableAnnotationComposer a) f) {
    final $$DbProductSpecTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dbProductSpec,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbProductSpecTableAnnotationComposer(
              $db: $db,
              $table: $db.dbProductSpec,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DbProductTableTableManager extends RootTableManager<
    _$TechHubDatabase,
    $DbProductTable,
    DbProductData,
    $$DbProductTableFilterComposer,
    $$DbProductTableOrderingComposer,
    $$DbProductTableAnnotationComposer,
    $$DbProductTableCreateCompanionBuilder,
    $$DbProductTableUpdateCompanionBuilder,
    (DbProductData, $$DbProductTableReferences),
    DbProductData,
    PrefetchHooks Function({bool storeId, bool dbProductSpecRefs})> {
  $$DbProductTableTableManager(_$TechHubDatabase db, $DbProductTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> storeId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double> originalPrice = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<double> rating = const Value.absent(),
            Value<int> reviewCount = const Value.absent(),
            Value<bool> inStock = const Value.absent(),
            Value<String> badge = const Value.absent(),
            Value<bool> bookmarked = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DbProductCompanion(
            id: id,
            storeId: storeId,
            name: name,
            description: description,
            price: price,
            originalPrice: originalPrice,
            imageUrl: imageUrl,
            rating: rating,
            reviewCount: reviewCount,
            inStock: inStock,
            badge: badge,
            bookmarked: bookmarked,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String storeId,
            required String name,
            required String description,
            required double price,
            required double originalPrice,
            required String imageUrl,
            required double rating,
            required int reviewCount,
            Value<bool> inStock = const Value.absent(),
            Value<String> badge = const Value.absent(),
            Value<bool> bookmarked = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DbProductCompanion.insert(
            id: id,
            storeId: storeId,
            name: name,
            description: description,
            price: price,
            originalPrice: originalPrice,
            imageUrl: imageUrl,
            rating: rating,
            reviewCount: reviewCount,
            inStock: inStock,
            badge: badge,
            bookmarked: bookmarked,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DbProductTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {storeId = false, dbProductSpecRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (dbProductSpecRefs) db.dbProductSpec
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (storeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.storeId,
                    referencedTable:
                        $$DbProductTableReferences._storeIdTable(db),
                    referencedColumn:
                        $$DbProductTableReferences._storeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbProductSpecRefs)
                    await $_getPrefetchedData<DbProductData, $DbProductTable,
                            DbProductSpecData>(
                        currentTable: table,
                        referencedTable: $$DbProductTableReferences
                            ._dbProductSpecRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DbProductTableReferences(db, table, p0)
                                .dbProductSpecRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DbProductTableProcessedTableManager = ProcessedTableManager<
    _$TechHubDatabase,
    $DbProductTable,
    DbProductData,
    $$DbProductTableFilterComposer,
    $$DbProductTableOrderingComposer,
    $$DbProductTableAnnotationComposer,
    $$DbProductTableCreateCompanionBuilder,
    $$DbProductTableUpdateCompanionBuilder,
    (DbProductData, $$DbProductTableReferences),
    DbProductData,
    PrefetchHooks Function({bool storeId, bool dbProductSpecRefs})>;
typedef $$DbProductSpecTableCreateCompanionBuilder = DbProductSpecCompanion
    Function({
  Value<int> id,
  required String productId,
  required String key,
  required String value,
});
typedef $$DbProductSpecTableUpdateCompanionBuilder = DbProductSpecCompanion
    Function({
  Value<int> id,
  Value<String> productId,
  Value<String> key,
  Value<String> value,
});

final class $$DbProductSpecTableReferences extends BaseReferences<
    _$TechHubDatabase, $DbProductSpecTable, DbProductSpecData> {
  $$DbProductSpecTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DbProductTable _productIdTable(_$TechHubDatabase db) =>
      db.dbProduct.createAlias(
          $_aliasNameGenerator(db.dbProductSpec.productId, db.dbProduct.id));

  $$DbProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$DbProductTableTableManager($_db, $_db.dbProduct)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DbProductSpecTableFilterComposer
    extends Composer<_$TechHubDatabase, $DbProductSpecTable> {
  $$DbProductSpecTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  $$DbProductTableFilterComposer get productId {
    final $$DbProductTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.dbProduct,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbProductTableFilterComposer(
              $db: $db,
              $table: $db.dbProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DbProductSpecTableOrderingComposer
    extends Composer<_$TechHubDatabase, $DbProductSpecTable> {
  $$DbProductSpecTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  $$DbProductTableOrderingComposer get productId {
    final $$DbProductTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.dbProduct,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbProductTableOrderingComposer(
              $db: $db,
              $table: $db.dbProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DbProductSpecTableAnnotationComposer
    extends Composer<_$TechHubDatabase, $DbProductSpecTable> {
  $$DbProductSpecTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$DbProductTableAnnotationComposer get productId {
    final $$DbProductTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.dbProduct,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbProductTableAnnotationComposer(
              $db: $db,
              $table: $db.dbProduct,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DbProductSpecTableTableManager extends RootTableManager<
    _$TechHubDatabase,
    $DbProductSpecTable,
    DbProductSpecData,
    $$DbProductSpecTableFilterComposer,
    $$DbProductSpecTableOrderingComposer,
    $$DbProductSpecTableAnnotationComposer,
    $$DbProductSpecTableCreateCompanionBuilder,
    $$DbProductSpecTableUpdateCompanionBuilder,
    (DbProductSpecData, $$DbProductSpecTableReferences),
    DbProductSpecData,
    PrefetchHooks Function({bool productId})> {
  $$DbProductSpecTableTableManager(
      _$TechHubDatabase db, $DbProductSpecTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbProductSpecTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbProductSpecTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbProductSpecTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
          }) =>
              DbProductSpecCompanion(
            id: id,
            productId: productId,
            key: key,
            value: value,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productId,
            required String key,
            required String value,
          }) =>
              DbProductSpecCompanion.insert(
            id: id,
            productId: productId,
            key: key,
            value: value,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DbProductSpecTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$DbProductSpecTableReferences._productIdTable(db),
                    referencedColumn:
                        $$DbProductSpecTableReferences._productIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DbProductSpecTableProcessedTableManager = ProcessedTableManager<
    _$TechHubDatabase,
    $DbProductSpecTable,
    DbProductSpecData,
    $$DbProductSpecTableFilterComposer,
    $$DbProductSpecTableOrderingComposer,
    $$DbProductSpecTableAnnotationComposer,
    $$DbProductSpecTableCreateCompanionBuilder,
    $$DbProductSpecTableUpdateCompanionBuilder,
    (DbProductSpecData, $$DbProductSpecTableReferences),
    DbProductSpecData,
    PrefetchHooks Function({bool productId})>;
typedef $$DbCartItemTableCreateCompanionBuilder = DbCartItemCompanion Function({
  required String id,
  required String productId,
  required String name,
  required double price,
  required int quantity,
  required String imageUrl,
  Value<int> rowid,
});
typedef $$DbCartItemTableUpdateCompanionBuilder = DbCartItemCompanion Function({
  Value<String> id,
  Value<String> productId,
  Value<String> name,
  Value<double> price,
  Value<int> quantity,
  Value<String> imageUrl,
  Value<int> rowid,
});

class $$DbCartItemTableFilterComposer
    extends Composer<_$TechHubDatabase, $DbCartItemTable> {
  $$DbCartItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));
}

class $$DbCartItemTableOrderingComposer
    extends Composer<_$TechHubDatabase, $DbCartItemTable> {
  $$DbCartItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));
}

class $$DbCartItemTableAnnotationComposer
    extends Composer<_$TechHubDatabase, $DbCartItemTable> {
  $$DbCartItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$DbCartItemTableTableManager extends RootTableManager<
    _$TechHubDatabase,
    $DbCartItemTable,
    DbCartItemData,
    $$DbCartItemTableFilterComposer,
    $$DbCartItemTableOrderingComposer,
    $$DbCartItemTableAnnotationComposer,
    $$DbCartItemTableCreateCompanionBuilder,
    $$DbCartItemTableUpdateCompanionBuilder,
    (
      DbCartItemData,
      BaseReferences<_$TechHubDatabase, $DbCartItemTable, DbCartItemData>
    ),
    DbCartItemData,
    PrefetchHooks Function()> {
  $$DbCartItemTableTableManager(_$TechHubDatabase db, $DbCartItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbCartItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbCartItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbCartItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DbCartItemCompanion(
            id: id,
            productId: productId,
            name: name,
            price: price,
            quantity: quantity,
            imageUrl: imageUrl,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String productId,
            required String name,
            required double price,
            required int quantity,
            required String imageUrl,
            Value<int> rowid = const Value.absent(),
          }) =>
              DbCartItemCompanion.insert(
            id: id,
            productId: productId,
            name: name,
            price: price,
            quantity: quantity,
            imageUrl: imageUrl,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DbCartItemTableProcessedTableManager = ProcessedTableManager<
    _$TechHubDatabase,
    $DbCartItemTable,
    DbCartItemData,
    $$DbCartItemTableFilterComposer,
    $$DbCartItemTableOrderingComposer,
    $$DbCartItemTableAnnotationComposer,
    $$DbCartItemTableCreateCompanionBuilder,
    $$DbCartItemTableUpdateCompanionBuilder,
    (
      DbCartItemData,
      BaseReferences<_$TechHubDatabase, $DbCartItemTable, DbCartItemData>
    ),
    DbCartItemData,
    PrefetchHooks Function()>;
typedef $$DbOrderTableCreateCompanionBuilder = DbOrderCompanion Function({
  Value<int> id,
  required String contactName,
  required String address,
  required String deliveryType,
  required String scheduledDate,
  required String scheduledTime,
  required double totalCost,
});
typedef $$DbOrderTableUpdateCompanionBuilder = DbOrderCompanion Function({
  Value<int> id,
  Value<String> contactName,
  Value<String> address,
  Value<String> deliveryType,
  Value<String> scheduledDate,
  Value<String> scheduledTime,
  Value<double> totalCost,
});

final class $$DbOrderTableReferences
    extends BaseReferences<_$TechHubDatabase, $DbOrderTable, DbOrderData> {
  $$DbOrderTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DbOrderItemTable, List<DbOrderItemData>>
      _dbOrderItemRefsTable(_$TechHubDatabase db) =>
          MultiTypedResultKey.fromTable(db.dbOrderItem,
              aliasName:
                  $_aliasNameGenerator(db.dbOrder.id, db.dbOrderItem.orderId));

  $$DbOrderItemTableProcessedTableManager get dbOrderItemRefs {
    final manager = $$DbOrderItemTableTableManager($_db, $_db.dbOrderItem)
        .filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_dbOrderItemRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DbOrderTableFilterComposer
    extends Composer<_$TechHubDatabase, $DbOrderTable> {
  $$DbOrderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactName => $composableBuilder(
      column: $table.contactName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deliveryType => $composableBuilder(
      column: $table.deliveryType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scheduledDate => $composableBuilder(
      column: $table.scheduledDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnFilters(column));

  Expression<bool> dbOrderItemRefs(
      Expression<bool> Function($$DbOrderItemTableFilterComposer f) f) {
    final $$DbOrderItemTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dbOrderItem,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbOrderItemTableFilterComposer(
              $db: $db,
              $table: $db.dbOrderItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DbOrderTableOrderingComposer
    extends Composer<_$TechHubDatabase, $DbOrderTable> {
  $$DbOrderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactName => $composableBuilder(
      column: $table.contactName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deliveryType => $composableBuilder(
      column: $table.deliveryType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scheduledDate => $composableBuilder(
      column: $table.scheduledDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalCost => $composableBuilder(
      column: $table.totalCost, builder: (column) => ColumnOrderings(column));
}

class $$DbOrderTableAnnotationComposer
    extends Composer<_$TechHubDatabase, $DbOrderTable> {
  $$DbOrderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get contactName => $composableBuilder(
      column: $table.contactName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get deliveryType => $composableBuilder(
      column: $table.deliveryType, builder: (column) => column);

  GeneratedColumn<String> get scheduledDate => $composableBuilder(
      column: $table.scheduledDate, builder: (column) => column);

  GeneratedColumn<String> get scheduledTime => $composableBuilder(
      column: $table.scheduledTime, builder: (column) => column);

  GeneratedColumn<double> get totalCost =>
      $composableBuilder(column: $table.totalCost, builder: (column) => column);

  Expression<T> dbOrderItemRefs<T extends Object>(
      Expression<T> Function($$DbOrderItemTableAnnotationComposer a) f) {
    final $$DbOrderItemTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.dbOrderItem,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbOrderItemTableAnnotationComposer(
              $db: $db,
              $table: $db.dbOrderItem,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DbOrderTableTableManager extends RootTableManager<
    _$TechHubDatabase,
    $DbOrderTable,
    DbOrderData,
    $$DbOrderTableFilterComposer,
    $$DbOrderTableOrderingComposer,
    $$DbOrderTableAnnotationComposer,
    $$DbOrderTableCreateCompanionBuilder,
    $$DbOrderTableUpdateCompanionBuilder,
    (DbOrderData, $$DbOrderTableReferences),
    DbOrderData,
    PrefetchHooks Function({bool dbOrderItemRefs})> {
  $$DbOrderTableTableManager(_$TechHubDatabase db, $DbOrderTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbOrderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbOrderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbOrderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> contactName = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String> deliveryType = const Value.absent(),
            Value<String> scheduledDate = const Value.absent(),
            Value<String> scheduledTime = const Value.absent(),
            Value<double> totalCost = const Value.absent(),
          }) =>
              DbOrderCompanion(
            id: id,
            contactName: contactName,
            address: address,
            deliveryType: deliveryType,
            scheduledDate: scheduledDate,
            scheduledTime: scheduledTime,
            totalCost: totalCost,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String contactName,
            required String address,
            required String deliveryType,
            required String scheduledDate,
            required String scheduledTime,
            required double totalCost,
          }) =>
              DbOrderCompanion.insert(
            id: id,
            contactName: contactName,
            address: address,
            deliveryType: deliveryType,
            scheduledDate: scheduledDate,
            scheduledTime: scheduledTime,
            totalCost: totalCost,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DbOrderTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({dbOrderItemRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (dbOrderItemRefs) db.dbOrderItem],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (dbOrderItemRefs)
                    await $_getPrefetchedData<DbOrderData, $DbOrderTable,
                            DbOrderItemData>(
                        currentTable: table,
                        referencedTable:
                            $$DbOrderTableReferences._dbOrderItemRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DbOrderTableReferences(db, table, p0)
                                .dbOrderItemRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.orderId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DbOrderTableProcessedTableManager = ProcessedTableManager<
    _$TechHubDatabase,
    $DbOrderTable,
    DbOrderData,
    $$DbOrderTableFilterComposer,
    $$DbOrderTableOrderingComposer,
    $$DbOrderTableAnnotationComposer,
    $$DbOrderTableCreateCompanionBuilder,
    $$DbOrderTableUpdateCompanionBuilder,
    (DbOrderData, $$DbOrderTableReferences),
    DbOrderData,
    PrefetchHooks Function({bool dbOrderItemRefs})>;
typedef $$DbOrderItemTableCreateCompanionBuilder = DbOrderItemCompanion
    Function({
  Value<int> id,
  required int orderId,
  required String productId,
  required String name,
  required double price,
  required int quantity,
  required String imageUrl,
});
typedef $$DbOrderItemTableUpdateCompanionBuilder = DbOrderItemCompanion
    Function({
  Value<int> id,
  Value<int> orderId,
  Value<String> productId,
  Value<String> name,
  Value<double> price,
  Value<int> quantity,
  Value<String> imageUrl,
});

final class $$DbOrderItemTableReferences extends BaseReferences<
    _$TechHubDatabase, $DbOrderItemTable, DbOrderItemData> {
  $$DbOrderItemTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DbOrderTable _orderIdTable(_$TechHubDatabase db) => db.dbOrder
      .createAlias($_aliasNameGenerator(db.dbOrderItem.orderId, db.dbOrder.id));

  $$DbOrderTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$DbOrderTableTableManager($_db, $_db.dbOrder)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DbOrderItemTableFilterComposer
    extends Composer<_$TechHubDatabase, $DbOrderItemTable> {
  $$DbOrderItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  $$DbOrderTableFilterComposer get orderId {
    final $$DbOrderTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.dbOrder,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbOrderTableFilterComposer(
              $db: $db,
              $table: $db.dbOrder,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DbOrderItemTableOrderingComposer
    extends Composer<_$TechHubDatabase, $DbOrderItemTable> {
  $$DbOrderItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  $$DbOrderTableOrderingComposer get orderId {
    final $$DbOrderTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.dbOrder,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbOrderTableOrderingComposer(
              $db: $db,
              $table: $db.dbOrder,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DbOrderItemTableAnnotationComposer
    extends Composer<_$TechHubDatabase, $DbOrderItemTable> {
  $$DbOrderItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$DbOrderTableAnnotationComposer get orderId {
    final $$DbOrderTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.dbOrder,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DbOrderTableAnnotationComposer(
              $db: $db,
              $table: $db.dbOrder,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DbOrderItemTableTableManager extends RootTableManager<
    _$TechHubDatabase,
    $DbOrderItemTable,
    DbOrderItemData,
    $$DbOrderItemTableFilterComposer,
    $$DbOrderItemTableOrderingComposer,
    $$DbOrderItemTableAnnotationComposer,
    $$DbOrderItemTableCreateCompanionBuilder,
    $$DbOrderItemTableUpdateCompanionBuilder,
    (DbOrderItemData, $$DbOrderItemTableReferences),
    DbOrderItemData,
    PrefetchHooks Function({bool orderId})> {
  $$DbOrderItemTableTableManager(_$TechHubDatabase db, $DbOrderItemTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbOrderItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbOrderItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbOrderItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
          }) =>
              DbOrderItemCompanion(
            id: id,
            orderId: orderId,
            productId: productId,
            name: name,
            price: price,
            quantity: quantity,
            imageUrl: imageUrl,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderId,
            required String productId,
            required String name,
            required double price,
            required int quantity,
            required String imageUrl,
          }) =>
              DbOrderItemCompanion.insert(
            id: id,
            orderId: orderId,
            productId: productId,
            name: name,
            price: price,
            quantity: quantity,
            imageUrl: imageUrl,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DbOrderItemTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderId,
                    referencedTable:
                        $$DbOrderItemTableReferences._orderIdTable(db),
                    referencedColumn:
                        $$DbOrderItemTableReferences._orderIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DbOrderItemTableProcessedTableManager = ProcessedTableManager<
    _$TechHubDatabase,
    $DbOrderItemTable,
    DbOrderItemData,
    $$DbOrderItemTableFilterComposer,
    $$DbOrderItemTableOrderingComposer,
    $$DbOrderItemTableAnnotationComposer,
    $$DbOrderItemTableCreateCompanionBuilder,
    $$DbOrderItemTableUpdateCompanionBuilder,
    (DbOrderItemData, $$DbOrderItemTableReferences),
    DbOrderItemData,
    PrefetchHooks Function({bool orderId})>;
typedef $$DbSearchHistoryTableCreateCompanionBuilder = DbSearchHistoryCompanion
    Function({
  Value<int> id,
  required String query,
  required DateTime searchedAt,
});
typedef $$DbSearchHistoryTableUpdateCompanionBuilder = DbSearchHistoryCompanion
    Function({
  Value<int> id,
  Value<String> query,
  Value<DateTime> searchedAt,
});

class $$DbSearchHistoryTableFilterComposer
    extends Composer<_$TechHubDatabase, $DbSearchHistoryTable> {
  $$DbSearchHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnFilters(column));
}

class $$DbSearchHistoryTableOrderingComposer
    extends Composer<_$TechHubDatabase, $DbSearchHistoryTable> {
  $$DbSearchHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnOrderings(column));
}

class $$DbSearchHistoryTableAnnotationComposer
    extends Composer<_$TechHubDatabase, $DbSearchHistoryTable> {
  $$DbSearchHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => column);
}

class $$DbSearchHistoryTableTableManager extends RootTableManager<
    _$TechHubDatabase,
    $DbSearchHistoryTable,
    DbSearchHistoryData,
    $$DbSearchHistoryTableFilterComposer,
    $$DbSearchHistoryTableOrderingComposer,
    $$DbSearchHistoryTableAnnotationComposer,
    $$DbSearchHistoryTableCreateCompanionBuilder,
    $$DbSearchHistoryTableUpdateCompanionBuilder,
    (
      DbSearchHistoryData,
      BaseReferences<_$TechHubDatabase, $DbSearchHistoryTable,
          DbSearchHistoryData>
    ),
    DbSearchHistoryData,
    PrefetchHooks Function()> {
  $$DbSearchHistoryTableTableManager(
      _$TechHubDatabase db, $DbSearchHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbSearchHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbSearchHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbSearchHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> query = const Value.absent(),
            Value<DateTime> searchedAt = const Value.absent(),
          }) =>
              DbSearchHistoryCompanion(
            id: id,
            query: query,
            searchedAt: searchedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String query,
            required DateTime searchedAt,
          }) =>
              DbSearchHistoryCompanion.insert(
            id: id,
            query: query,
            searchedAt: searchedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DbSearchHistoryTableProcessedTableManager = ProcessedTableManager<
    _$TechHubDatabase,
    $DbSearchHistoryTable,
    DbSearchHistoryData,
    $$DbSearchHistoryTableFilterComposer,
    $$DbSearchHistoryTableOrderingComposer,
    $$DbSearchHistoryTableAnnotationComposer,
    $$DbSearchHistoryTableCreateCompanionBuilder,
    $$DbSearchHistoryTableUpdateCompanionBuilder,
    (
      DbSearchHistoryData,
      BaseReferences<_$TechHubDatabase, $DbSearchHistoryTable,
          DbSearchHistoryData>
    ),
    DbSearchHistoryData,
    PrefetchHooks Function()>;

class $TechHubDatabaseManager {
  final _$TechHubDatabase _db;
  $TechHubDatabaseManager(this._db);
  $$DbStoreTableTableManager get dbStore =>
      $$DbStoreTableTableManager(_db, _db.dbStore);
  $$DbProductTableTableManager get dbProduct =>
      $$DbProductTableTableManager(_db, _db.dbProduct);
  $$DbProductSpecTableTableManager get dbProductSpec =>
      $$DbProductSpecTableTableManager(_db, _db.dbProductSpec);
  $$DbCartItemTableTableManager get dbCartItem =>
      $$DbCartItemTableTableManager(_db, _db.dbCartItem);
  $$DbOrderTableTableManager get dbOrder =>
      $$DbOrderTableTableManager(_db, _db.dbOrder);
  $$DbOrderItemTableTableManager get dbOrderItem =>
      $$DbOrderItemTableTableManager(_db, _db.dbOrderItem);
  $$DbSearchHistoryTableTableManager get dbSearchHistory =>
      $$DbSearchHistoryTableTableManager(_db, _db.dbSearchHistory);
}

mixin _$StoreDaoMixin on DatabaseAccessor<TechHubDatabase> {
  $DbStoreTable get dbStore => attachedDatabase.dbStore;
  $DbProductTable get dbProduct => attachedDatabase.dbProduct;
  StoreDaoManager get managers => StoreDaoManager(this);
}

class StoreDaoManager {
  final _$StoreDaoMixin _db;
  StoreDaoManager(this._db);
  $$DbStoreTableTableManager get dbStore =>
      $$DbStoreTableTableManager(_db.attachedDatabase, _db.dbStore);
  $$DbProductTableTableManager get dbProduct =>
      $$DbProductTableTableManager(_db.attachedDatabase, _db.dbProduct);
}

mixin _$ProductDaoMixin on DatabaseAccessor<TechHubDatabase> {
  $DbStoreTable get dbStore => attachedDatabase.dbStore;
  $DbProductTable get dbProduct => attachedDatabase.dbProduct;
  $DbProductSpecTable get dbProductSpec => attachedDatabase.dbProductSpec;
  ProductDaoManager get managers => ProductDaoManager(this);
}

class ProductDaoManager {
  final _$ProductDaoMixin _db;
  ProductDaoManager(this._db);
  $$DbStoreTableTableManager get dbStore =>
      $$DbStoreTableTableManager(_db.attachedDatabase, _db.dbStore);
  $$DbProductTableTableManager get dbProduct =>
      $$DbProductTableTableManager(_db.attachedDatabase, _db.dbProduct);
  $$DbProductSpecTableTableManager get dbProductSpec =>
      $$DbProductSpecTableTableManager(_db.attachedDatabase, _db.dbProductSpec);
}

mixin _$CartDaoMixin on DatabaseAccessor<TechHubDatabase> {
  $DbCartItemTable get dbCartItem => attachedDatabase.dbCartItem;
  CartDaoManager get managers => CartDaoManager(this);
}

class CartDaoManager {
  final _$CartDaoMixin _db;
  CartDaoManager(this._db);
  $$DbCartItemTableTableManager get dbCartItem =>
      $$DbCartItemTableTableManager(_db.attachedDatabase, _db.dbCartItem);
}

mixin _$OrderDaoMixin on DatabaseAccessor<TechHubDatabase> {
  $DbOrderTable get dbOrder => attachedDatabase.dbOrder;
  $DbOrderItemTable get dbOrderItem => attachedDatabase.dbOrderItem;
  OrderDaoManager get managers => OrderDaoManager(this);
}

class OrderDaoManager {
  final _$OrderDaoMixin _db;
  OrderDaoManager(this._db);
  $$DbOrderTableTableManager get dbOrder =>
      $$DbOrderTableTableManager(_db.attachedDatabase, _db.dbOrder);
  $$DbOrderItemTableTableManager get dbOrderItem =>
      $$DbOrderItemTableTableManager(_db.attachedDatabase, _db.dbOrderItem);
}

mixin _$SearchHistoryDaoMixin on DatabaseAccessor<TechHubDatabase> {
  $DbSearchHistoryTable get dbSearchHistory => attachedDatabase.dbSearchHistory;
  SearchHistoryDaoManager get managers => SearchHistoryDaoManager(this);
}

class SearchHistoryDaoManager {
  final _$SearchHistoryDaoMixin _db;
  SearchHistoryDaoManager(this._db);
  $$DbSearchHistoryTableTableManager get dbSearchHistory =>
      $$DbSearchHistoryTableTableManager(
          _db.attachedDatabase, _db.dbSearchHistory);
}
