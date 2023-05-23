import 'package:http/http.dart' as http;
import 'user_model.dart';
import 'dart:convert';
import 'product.dart';

class PostController {
  static Future<List<Product>> getData({int index = 0, int banyak = 10}) async {
    Uri url = Uri.parse(
        "https://dummyjson.com/products?limit=${banyak}&skip=${index}");
    List<Product> products = [];
    final res = await http.get(url);
    var data = jsonDecode(res.body);
    // print("Data : ${data}");
    var dataPost = data['products'];
    print("Data Post : ${dataPost}");
    for (var i in dataPost) {
      final product = Product.fromJson(i);
      products.add(product);
    }

    // throw Error();
    return products;
  }

  static Future<User> login(
      {required String username, required String password}) async {
    Uri url = Uri.parse("https://dummyjson.com/auth/login");

    final res = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    var data = jsonDecode(res.body);
    final product = User.fromJson(data);
    print(product);
    // throw Error();
    return product;
  }
}
