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

  @override
  List<Object?> get props => [id, title, image, price, description, category];

  @override
  String toString() {
    return 'DetailsProductModel(id: $id, title: $title, price: $price, category: $category)';
  }
}
