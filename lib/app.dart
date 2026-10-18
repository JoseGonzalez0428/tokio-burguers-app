import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';
import 'features/cart/presentation/cart_provider.dart';
import 'features/menu/presentation/menu_provider.dart';

class TokioApp extends StatelessWidget {
  const TokioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: "Tokio Burguer's",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: Routes.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
