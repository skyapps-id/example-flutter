import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/catalog_bloc.dart';
import '../bloc/catalog_state.dart';
import '../models/catalog.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogs'),
      ),
      body: Center(
        child: BlocBuilder<CatalogBloc, CatalogState>(
          builder: (context, state) {
            if (state is CatalogLoading) {
              return const CircularProgressIndicator();
            } else if (state is CatalogLoaded) {
              return ListView.builder(
                itemCount: state.catalogs.length,
                itemBuilder: (context, index) {
                  Catalog catalog = state.catalogs[index];
                  return ListTile(
                    title: Text(catalog.title),
                    subtitle: Text(catalog.body.substring(1, 100)),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: catalog,
                      );
                    },
                  );
                },
              );
            } else if (state is CatalogError) {
              return Text('Error: ${state.message}');
            } else {
              return const Text('No data found');
            }
          },
        ),
      ),
    );
  }
}
