import 'category.dart';
import 'product.dart';

/// Menú estático de Tokio Burguer's, tomado del menú impreso.
///
/// Pendiente de confirmar con el dueño:
///  - Precio de "Aros de cebolla" (aparece tachado en el menú; no se incluye).
///  - Si la Michelada (lleva alcohol) se vende por la app.
///  - Imágenes de producto (`imageAsset` queda nulo por ahora).
class MenuData {
  MenuData._();

  static const List<Category> categories = [
    Category(id: 1, name: 'Hamburguesas'),
    Category(id: 2, name: 'Hot Dogs'),
    Category(id: 3, name: 'Alitas adobadas'),
    Category(id: 4, name: 'Gringas'),
    Category(id: 5, name: 'Extras'),
    Category(id: 6, name: 'Bebidas'),
  ];

  static const List<Product> products = [
    // Hamburguesas
    Product(
      id: 1,
      categoryId: 1,
      name: 'La Clásica',
      description:
          'Carne de res, tomate, lechuga, aguacate, cebolla y nuestra salsa secreta.',
      price: 130,
      isFeatured: true,
    ),
    Product(
      id: 2,
      categoryId: 1,
      name: 'Pollo',
      description:
          'Pollo empanizado, lechuga, queso americano, aderezo y pepinillos.',
      price: 130,
    ),
    Product(
      id: 3,
      categoryId: 1,
      name: 'Hawaiana',
      description: 'Carne de res, lechuga, piña especial y salsa secreta.',
      price: 130,
    ),
    Product(
      id: 4,
      categoryId: 1,
      name: 'Americana (nueva receta)',
      description:
          'Doble carne de res al carbón, tocino crujiente, queso americano, cebolla caramelizada, lechuga, tomate, pepinillos y nuestra salsa secreta.',
      price: 140,
      isFeatured: true,
    ),
    // Hot Dogs
    Product(
      id: 5,
      categoryId: 2,
      name: 'Hot Dog Sencillo',
      description: 'Jitomate, cebolla, aguacate, chile en vinagre y mayonesa.',
      price: 50,
    ),
    Product(
      id: 6,
      categoryId: 2,
      name: 'Hot Dog Especial',
      description:
          'Costra de queso, cebolla caramelizada, arrachera y salsa secreta.',
      price: 80,
    ),
    // Alitas adobadas
    Product(
      id: 7,
      categoryId: 3,
      name: 'Alitas adobadas — media orden',
      description: '4 alitas con papas.',
      price: 65,
    ),
    Product(
      id: 8,
      categoryId: 3,
      name: 'Alitas adobadas — orden completa',
      description: '8 alitas con papas.',
      price: 140,
    ),
    // Gringas
    Product(id: 9, categoryId: 4, name: 'Gringa chica', price: 60),
    Product(id: 10, categoryId: 4, name: 'Gringa grande', price: 90),
    // Extras
    Product(id: 11, categoryId: 5, name: 'Orden de papas', price: 70),
    Product(id: 12, categoryId: 5, name: 'Salchipapas', price: 80),
    Product(
      id: 13,
      categoryId: 5,
      name: 'Tokio Papas',
      description: 'Papas gajo con arrachera y costra de queso.',
      price: 110,
      isFeatured: true,
    ),
    // Bebidas
    Product(id: 14, categoryId: 6, name: 'Refresco en botella', price: 30),
    Product(id: 15, categoryId: 6, name: 'Refrescos de sabor', price: 30),
    Product(
      id: 16,
      categoryId: 6,
      name: 'Limonada natural / mineral',
      price: 30,
    ),
    Product(id: 17, categoryId: 6, name: 'Michelada', price: 50),
    Product(id: 18, categoryId: 6, name: 'Frappé', price: 50),
  ];
}
