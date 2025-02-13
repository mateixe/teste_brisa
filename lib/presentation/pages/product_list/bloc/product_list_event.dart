part of 'product_list_bloc.dart';

abstract class ProductDataEvent extends Equatable {
  const ProductDataEvent();

  @override
  List<Object> get props => [];
}

class LoadProductDataEvent extends ProductDataEvent {}