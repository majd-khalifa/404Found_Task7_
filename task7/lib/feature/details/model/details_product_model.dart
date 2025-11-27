import 'package:equatable/equatable.dart';

class DetailsProductModel extends Equatable {
  final int id;
  final String title;
  final String image;
  final double price;
  final String description;
  final String category;

  const DetailsProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
  });

  /// ✅ Factory method لتحويل JSON إلى موديل
  factory DetailsProductModel.fromJson(Map<String, dynamic> json) {
    return DetailsProductModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
    );
  }

  /// ✅ تحويل الموديل إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'price': price,
      'description': description,
      'category': category,
    };
  }

  /// ✅ copyWith لتعديل قيم معينة بدون إنشاء موديل جديد كامل
  DetailsProductModel copyWith({
    int? id,
    String? title,
    String? image,
    double? price,
    String? description,
    String? category,
  }) {
    return DetailsProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
    );
  }

  /// ✅ props من Equatable (تغني عن == و hashCode)
  @override
  List<Object?> get props => [id, title, image, price, description, category];

  /// ✅ toString لسهولة الطباعة أثناء الـ debugging
  @override
  String toString() {
    return 'DetailsProductModel(id: $id, title: $title, price: $price, category: $category)';
  }
}
