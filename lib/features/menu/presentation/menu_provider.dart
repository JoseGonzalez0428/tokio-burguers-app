// Flutter define su propia anotación `Category`; importamos solo lo necesario
// para que no choque con nuestro modelo `Category`.
import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../data/category.dart';
import '../data/menu_data.dart';
import '../data/product.dart';

/// Estado del menú: lista de platillos y filtro por categoría.
class MenuProvider extends ChangeNotifier {
  int? _selectedCategoryId; // null = todas

  List<Category> get categories => MenuData.categories;
  List<Product> get products => MenuData.products;
  int? get selectedCategoryId => _selectedCategoryId;

  List<Product> get filteredProducts {
    if (_selectedCategoryId == null) return MenuData.products;
    return MenuData.products
        .where((p) => p.categoryId == _selectedCategoryId)
        .toList(growable: false);
  }

  void selectCategory(int? categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }
}
