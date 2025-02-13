import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_brisa/model/data_objects/product.dart';
import 'package:teste_brisa/model/repository/product_repository.dart';
import 'package:teste_brisa/presentation/pages/product_list/bloc/product_list_bloc.dart';

class ProductListView extends StatelessWidget {
  final ProductListBloc _bloc = ProductListBloc(ProductsRepository());

  ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductListBloc,ProductListDataState>(
          builder: (context, state) {
            return SafeArea(
              child: Placeholder(),
            );
          }),
    );
  }
}
