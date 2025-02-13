import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_brisa/model/data_objects/product.dart';

import 'package:teste_brisa/model/repository/product_repository.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductDataEvent, ProductListDataState> {
  final ProductsRepository productRepository;

  ProductListBloc(this.productRepository)
      : super(ProductListDataInitialState()) {
    on<ProductDataEvent>((event, emit) async {
      if (event is LoadProductDataEvent) {
        emit(ProductListDataLoadingState());
        List<Product>? apiResult = await productRepository.getProductsData();
        if (apiResult == null) {
          emit(ProductListDataErrorState());
        } else {
          emit(ProductListDataLoadedState(apiResult: apiResult));
        }
      }
    });
  }
}
