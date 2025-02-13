import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_brisa/model/data_objects/product.dart';
import 'package:teste_brisa/model/repository/product_repository.dart';
import 'package:teste_brisa/presentation/pages/product_list/bloc/product_list_bloc.dart';

class ProductListView extends StatefulWidget {
  final ProductListBloc _bloc = ProductListBloc(ProductsRepository());

  ProductListView({super.key});

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: BlocBuilder<ProductListBloc, ProductListDataState>(
  //         bloc: _bloc,
  //         builder: (context, state) {
  //           return state is! ProductListDataLoadedState
  //               ? const SafeArea(child: Placeholder())
  //               : SafeArea(
  //                   child: ListView.builder(
  //                     itemBuilder: (context, index) {
  //                       return ListTile(
  //                         tileColor: Colors.white60,
  //                         title: Text(state.apiResult[index].title),
  //                         subtitle: Text(state.apiResult[index].body),
  //                       );
  //                     },
  //                     itemCount: state.apiResult.length,
  //                   ),
  //                 );
  //         }),
  //   );
  // }

  @override
  State<StatefulWidget> createState() => _ProductListViewState(_bloc);
}

class _ProductListViewState extends State<ProductListView> {
  ProductListBloc _bloc;

  _ProductListViewState(this._bloc);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  void initState() {
    super.initState();
    // _bloc = ProductListBloc(ProductsRepository());
    _bloc.add(LoadProductDataEvent());

  }
}
