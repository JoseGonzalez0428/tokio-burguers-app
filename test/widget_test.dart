// Pruebas unitarias básicas (sin UI).
// Nota: se llama widget_test.dart para reemplazar el test de ejemplo que genera
// `flutter create` (que referencia MyApp y rompería `flutter analyze`).
import 'package:flutter_test/flutter_test.dart';
import 'package:tokio_burguers/core/utils/formatters.dart';
import 'package:tokio_burguers/features/cart/presentation/cart_provider.dart';
import 'package:tokio_burguers/features/menu/data/menu_data.dart';
import 'package:tokio_burguers/features/menu/data/product.dart';

const _burger = Product(id: 1, categoryId: 1, name: 'La Clásica', price: 130);
const _fries = Product(id: 2, categoryId: 5, name: 'Orden de papas', price: 70);

void main() {
  group('CartProvider', () {
    test('suma cantidades del mismo producto y calcula el subtotal', () {
      final cart = CartProvider();
      cart.add(_burger);
      cart.add(_burger, quantity: 2);
      cart.add(_fries);

      expect(cart.itemCount, 4);
      expect(cart.subtotal, 130 * 3 + 70);
    });

    test('setQuantity <= 0 elimina el producto', () {
      final cart = CartProvider();
      cart.add(_burger);
      cart.setQuantity(_burger.id, 0);

      expect(cart.isEmpty, isTrue);
    });
  });

  group('MenuData', () {
    test('todos los platillos pertenecen a una categoría existente', () {
      final ids = MenuData.categories.map((c) => c.id).toSet();
      for (final p in MenuData.products) {
        expect(ids.contains(p.categoryId), isTrue, reason: p.name);
      }
    });

    test('los ids de platillos son únicos', () {
      final ids = MenuData.products.map((p) => p.id).toList();
      expect(ids.toSet().length, ids.length);
    });
  });

  test('formatMxn', () {
    expect(formatMxn(130), r'$130');
    expect(formatMxn(12.5), r'$12.50');
  });
}
