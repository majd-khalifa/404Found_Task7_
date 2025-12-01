class HomeProductModel {
  final int id;
  final String title;
  final String image;
  final double price;
  final String category;

  const HomeProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.category,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
      id: json['id'] as int,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] as num).toDouble(),
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'category': category,
    };
  }

  HomeProductModel copyWith({
    int? id,
    String? title,
    String? image,
    double? price,
    String? category,
  }) {
    return HomeProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeProductModel &&
        other.id == id &&
        other.title == title &&
        other.image == image &&
        other.price == price &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        image.hashCode ^
        price.hashCode ^
        category.hashCode;
  }
}
