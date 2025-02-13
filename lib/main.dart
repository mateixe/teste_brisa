import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_brisa/model/repository/product_repository.dart';
import 'package:teste_brisa/presentation/pages/product_list/bloc/product_list_bloc.dart';
import 'package:teste_brisa/presentation/pages/product_list/views/product_list_view.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ProductListBloc(ProductsRepository()),
      child: TesteBrisa(),
    ),
  );
}

class TesteBrisa extends StatelessWidget {
  const TesteBrisa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Brisa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProductListView(),
    );
  }
}
