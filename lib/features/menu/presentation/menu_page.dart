import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/product_image.dart';
import '../../cart/presentation/cart_provider.dart';
import '../data/product.dart';
import 'menu_provider.dart';

/// Pestaña "Menú": filtro por categoría y lista de platillos.
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final menu = context.watch<MenuProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('MENÚ')),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                _CategoryChip(
                  label: 'Todos',
                  selected: menu.selectedCategoryId == null,
                  onTap: () => menu.selectCategory(null),
                ),
                for (final c in menu.categories)
                  _CategoryChip(
                    label: c.name,
                    selected: menu.selectedCategoryId == c.id,
                    onTap: () => menu.selectCategory(c.id),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
              itemCount: menu.filteredProducts.length,
              itemBuilder: (context, index) =>
                  _ProductTile(product: menu.filteredProducts[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
        selectedColor: AppColors.red,
        labelStyle: TextStyle(
          color: selected ? Colors.white : AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({required this.product});

  final Product product;

  void _addToCart(BuildContext context) {
    context.read<CartProvider>().add(product);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('${product.name} agregado al pedido')),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.pushNamed(
          context,
          Routes.productDetail,
          arguments: product,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ProductImage(
                imageAsset: product.imageAsset,
                width: 72,
                height: 72,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                    if (product.description.isNotEmpty)
                      Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      formatMxn(product.price),
                      style: const TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton.filled(
                onPressed: () => _addToCart(context),
                icon: const Icon(Icons.add),
                tooltip: 'Agregar al pedido',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
