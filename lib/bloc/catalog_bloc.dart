import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import 'catalog_event.dart';
import 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitial()) {
    on<FetchCatalogs>((event, emit) async {
      emit(CatalogLoading());
      try {
        final catalogs = await ApiService.fetchCatalogs();
        emit(CatalogLoaded(catalogs: catalogs));
      } catch (e) {
        emit(CatalogError(message: e.toString()));
      }
    });
  }
}
