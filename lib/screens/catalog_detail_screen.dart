import 'package:flutter/material.dart';
import '../models/catalog.dart';

class CatalogDetailScreen extends StatelessWidget {
  final Catalog catalog;

  const CatalogDetailScreen({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catalog.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              catalog.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(catalog.body),
          ],
        ),
      ),
    );
  }
}
