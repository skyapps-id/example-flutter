import 'package:equatable/equatable.dart';
import '../models/catalog.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object> get props => [];
}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  final List<Catalog> catalogs;

  const CatalogLoaded({required this.catalogs});

  @override
  List<Object> get props => [catalogs];
}

class CatalogError extends CatalogState {
  final String message;

  const CatalogError({required this.message});

  @override
  List<Object> get props => [message];
}
