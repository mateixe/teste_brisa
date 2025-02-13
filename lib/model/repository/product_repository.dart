import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste_brisa/model/data_objects/product.dart';

class ProductsRepository {
  Future<List<Product>?> getProductsData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    final result = await http.Client().get(Uri.parse(url));
    if (result.statusCode != 200) {
      return null;
    } else {
      Iterable models = jsonDecode(result.body);
      List<Product> dataModels = [];
      for (var model in models) {
        Product dataModel = Product.fromJson(model);
        dataModels.add(dataModel);
      }
      return dataModels;
    }
  }
}