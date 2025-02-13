import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:teste_brisa/config/constants.dart';
import 'package:teste_brisa/model/data_objects/product.dart';

class ProductsRepository {
  ProductsRepository() {
    init();
  }

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    _box = await Hive.openBox(Constants.prefsProductsListToken);
    // bool boxExists = await Hive.boxExists(Constants.prefsProductsListToken);
    //   _box = !boxExists ? await Hive.openBox(Constants.prefsProductsListToken) : Hive.box(Constants.prefsProductsListToken);
  }

  late Box _box;

  Future<List<Product>?> getProductsData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    final result = await http.Client().get(Uri.parse(url));
    if (result.statusCode != 200) {
      return null;
    } else {
      Iterable models = jsonDecode(result.body);
      await persistListLocally(result.body);

      List<Product> products = [];
      for (var model in models) {
        Product dataModel = Product.fromJson(model);
        products.add(dataModel);
      }

      return products;
    }
  }

  Future<void> persistListLocally(String productsJson) async {
    await _box.put(Constants.prefsProductsListToken, productsJson);
  }
}
