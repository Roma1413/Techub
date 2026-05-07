import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product.dart';

class StoreService {
  static Future<List<TechStore>> loadStores() async {
    final data = await rootBundle.loadString('assets/data/stores.json');

    final jsonResult = jsonDecode(data);

    return (jsonResult['stores'] as List)
        .map((e) => TechStore.fromJson(e))
        .toList();
  }
}