import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/brand_logo.dart';
import '../../menu/presentation/menu_provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, required this.onOpenMenu});

  final VoidCallback onOpenMenu;

  @override
  Widget build(BuildContext context) {
    final menu = context.watch<MenuProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("TOKIO BURGUER'S")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Banner de marca
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.red, width: 3),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SIEMPRE\nHAY MÁS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          height: 1.05,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Arma tu pedido y revisa nuestro menú completo.',
                        style: TextStyle(color: AppColors.cream),
                      ),
                      const SizedBox(height: 14),
                      FilledButton(
                        onPressed: onOpenMenu,
                        child: const Text('Ver menú'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const BrandLogo(size: 88),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Datos del negocio (del menú impreso)
          const Card(
            child: ListTile(
              leading: Icon(Icons.delivery_dining, color: AppColors.red),
              title: Text(
                'Servicio a domicilio',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text('485 129 93 17 · Calle Privada Conalep No. 6-A'),
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'CATEGORÍAS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final c in menu.categories)
                ActionChip(
                  label: Text(c.name),
                  labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                  onPressed: () {
                    menu.selectCategory(c.id);
                    onOpenMenu();
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
