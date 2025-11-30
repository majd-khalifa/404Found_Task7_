import 'package:flutter/material.dart';
import '../model/cart_product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => List.unmodifiable(_items);

  // ✅ إضافة منتج للسلة
  void addItem(CartItemModel item) {
    // إذا المنتج موجود مسبقًا، زيد الكمية بدل إضافة نسخة جديدة
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  // ✅ حذف منتج من السلة
  void removeItem(CartItemModel item) {
    _items.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  // ✅ زيادة الكمية
  void incrementQuantity(CartItemModel item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  // ✅ إنقاص الكمية
  void decrementQuantity(CartItemModel item) {
    final index = _items.indexWhere((element) => element.id == item.id);
    if (index != -1 && _items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  // ✅ حساب المجموع الكلي
  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // ✅ تفريغ السلة
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
