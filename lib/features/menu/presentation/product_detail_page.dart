import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/widgets/product_image.dart';
import '../../cart/presentation/cart_provider.dart';
import '../data/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 1;

  void _addToCart() {
    context.read<CartProvider>().add(widget.product, quantity: _quantity);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${widget.product.name} agregado al pedido')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final subtotal = product.price * _quantity;

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final image = ProductImage(
            imageAsset: product.imageAsset,
            height: 220,
            width: double.infinity,
          );

          final info = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 4),
              Text(
                formatMxn(product.price),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 12),
              if (product.description.isNotEmpty) Text(product.description),
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton.outlined(
                    onPressed:
                        _quantity > 1 ? () => setState(() => _quantity--) : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '$_quantity',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IconButton.outlined(
                    onPressed: () => setState(() => _quantity++),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _addToCart,
                  child: Text('Agregar al pedido · ${formatMxn(subtotal)}'),
                ),
              ),
            ],
          );

          // Adaptabilidad: en horizontal / tablet, imagen e info lado a lado.
          if (constraints.maxWidth >= 600) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: image),
                  const SizedBox(width: 24),
                  Expanded(child: SingleChildScrollView(child: info)),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [image, const SizedBox(height: 16), info],
          );
        },
      ),
    );
  }
}
