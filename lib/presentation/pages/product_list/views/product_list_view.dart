import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_brisa/model/data_objects/product.dart';
import 'package:teste_brisa/model/repository/product_repository.dart';
import 'package:teste_brisa/presentation/pages/common/product_card.dart';
import 'package:teste_brisa/presentation/pages/product_list/bloc/product_list_bloc.dart';

import '../../../../config/constants.dart';

class ProductListView extends StatelessWidget {
  final ProductListBloc _bloc = ProductListBloc(ProductsRepository());

  ProductListView({super.key}) {
    _bloc.add(LoadProductDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductListBloc, ProductListDataState>(
          bloc: _bloc,
          builder: (context, state) {
            return state is! ProductListDataLoadedState
                ? const SafeArea(
                    child: Center(
                    child: Text(Constants.loading),
                  ))
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ProductCard(product: state.apiResult[index]);
                          },
                          itemCount: state.apiResult.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            _bloc.add(LoadProductDataEvent());
                          },
                          child: const Text(Constants.reload),
                        ),
                      ),
                    ],
                  );
          }),
    );
  }
}
