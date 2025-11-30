class CartItemModel {
  final int id;
  final String title;
  final double price;
  final String imageUrl;
  int quantity;

  CartItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  // ✅ تحويل إلى Map (مفيد للتخزين أو الـ JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }

  // ✅ إنشاء من Map (مفيد عند القراءة من قاعدة بيانات أو API)
  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: (map['price'] as num).toDouble(),
      imageUrl: map['imageUrl'] as String,
      quantity: map['quantity'] ?? 1,
    );
  }
}
