import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:productdetail_getpost_api/screens/home/model/homemodel.dart';

class Apihelper
{
  Future<List<ProductModel>> getProductApi()
  async {
    Uri uri = Uri.parse("https://apidatahub.000webhostapp.com/MyShop/API/products.php");
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    List<ProductModel>  productList =[];

    for(var x in json)
      {
        ProductModel  p1 = ProductModel.fromJson(x);
        productList.add(p1);
      }

    print(json);
    print("=========================${productList.length}====================================================");
    return productList;
  }
}