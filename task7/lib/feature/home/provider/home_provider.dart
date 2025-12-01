import 'package:flutter/material.dart';
import '../data/home_repository.dart';
import '../model/home_product_model.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repo;
  HomeProvider(this.repo);

  List<HomeProductModel> products = [];
  List<String> categories = [];
  List<String>? selectedCategories;
  RangeValues? selectedPriceRange;
  String? searchQuery;

  bool isLoading = false;
  String? error;

  Future<void> loadProducts() async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      products = await repo.getProducts();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadCategories() async {
    try {
      categories = await repo.getCategories();
      notifyListeners();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }

  void setCategory(String category) {
    selectedCategories = [category];
    notifyListeners();
  }

  void setFilter(List<String> cats, RangeValues range) {
    selectedCategories = cats;
    selectedPriceRange = range;
    notifyListeners();
  }

  void setSearch(String query) {
    searchQuery = query;
    notifyListeners();
  }

  List<HomeProductModel> get filteredProducts {
    return products.where((p) {
      final matchesCategory =
          selectedCategories == null ||
          selectedCategories!.isEmpty ||
          selectedCategories!.contains(p.category);

      final matchesPrice =
          selectedPriceRange == null ||
          (p.price >= selectedPriceRange!.start &&
              p.price <= selectedPriceRange!.end);

      final matchesSearch =
          searchQuery == null ||
          p.title.toLowerCase().contains(searchQuery!.toLowerCase());

      return matchesCategory && matchesPrice && matchesSearch;
    }).toList();
  }
}
