part of 'product_list_bloc.dart';

abstract class ProductListDataState extends Equatable {
  const ProductListDataState();

  @override
  List<Object> get props => [];
}

class ProductListDataInitialState extends ProductListDataState {}

class ProductListDataLoadingState extends ProductListDataState {}

class ProductListDataLoadedState extends ProductListDataState {
  final List<Product> apiResult;
  const ProductListDataLoadedState({
    required this.apiResult,
  });
}

class ProductListDataErrorState extends ProductListDataState {}