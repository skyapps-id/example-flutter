import 'package:flutter/material.dart';
import 'models/catalog.dart';
import 'screens/catalog_detail_screen.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/detail':
      final catalog = settings.arguments as Catalog;
      return _buildPageRoute(
        CatalogDetailScreen(catalog: catalog),
      );
    default:
      return null;
  }
}

PageRouteBuilder _buildPageRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
