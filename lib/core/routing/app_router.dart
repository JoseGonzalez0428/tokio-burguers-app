import 'package:flutter/material.dart';

import '../../features/home/presentation/main_shell.dart';
import '../../features/menu/data/product.dart';
import '../../features/menu/presentation/product_detail_page.dart';
import '../widgets/coming_soon_page.dart';
import 'routes.dart';

/// Ruteo con Navigator y rutas nombradas.
class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productDetail:
        final product = settings.arguments as Product;
        return _page(ProductDetailPage(product: product), settings);
      case Routes.checkout:
        return _page(const ComingSoonPage(title: 'Finalizar pedido'), settings);
      case Routes.home:
      default:
        return _page(const MainShell(), settings);
    }
  }

  static MaterialPageRoute<dynamic> _page(Widget child, RouteSettings s) {
    return MaterialPageRoute<dynamic>(builder: (_) => child, settings: s);
  }
}
