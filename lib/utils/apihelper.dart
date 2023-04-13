import 'dart:convert';

import 'package:http/http.dart' as http;

class Apihelper
{
  Future<List> getProductApi()
  async {
    String link = "https://apidatahub.000webhostapp.com/MyShop/API/products.php";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    List<dynamic> l1 = json;
    return l1;
  }
}