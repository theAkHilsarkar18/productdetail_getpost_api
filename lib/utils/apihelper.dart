import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:productdetail_getpost_api/screens/home/model/homemodel.dart';

class Apihelper
{
  Future<List<dynamic>> getProductApi()
  async {
    Uri uri = Uri.parse("https://apidatahub.000webhostapp.com/MyShop/API/products.php");
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    List<dynamic> pList = [];
    //List<dynamic> pList = json.map((e) => ProductModel.fromJson(e)).toList();
    for(var x in json)
      {
        ProductModel  p1 = ProductModel.fromJson(x);
        pList.add(p1);
      }
    return pList;
  }


  Future<String> postProductApi(String name,String rate,String price, String offer,String desc,)
  async {
    Uri uri = Uri.parse("https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php");
    var json = await http.post(uri,body: {
      "product_name": name,
      "product_price": price,
      "product_offer": offer,
      "product_category": "mobile",
      "product_image": "google.com",
      "product_desc": desc,
      "product_rate": rate,
    });
    print("post api called------------------------------------------------");
    if(json.statusCode==200)
      {
        return "Added Successful !";
      }
    return "Failed !";

  }
}