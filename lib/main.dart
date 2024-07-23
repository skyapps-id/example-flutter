import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/catalog_bloc.dart';
import 'bloc/catalog_event.dart';
import 'router.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog Fetch Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CatalogBloc()..add(FetchCatalogs()),
        child: const HomeScreen(),
      ),
      onGenerateRoute: onGenerateRoute,
    );
  }
}
