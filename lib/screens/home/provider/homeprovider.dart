import 'package:flutter/widgets.dart';
import 'package:productdetail_getpost_api/screens/home/model/homemodel.dart';
import 'package:productdetail_getpost_api/utils/apihelper.dart';

class Homeprovider extends ChangeNotifier
{
  List<ProductModel> productList = [];
  Future<void> productApiCalling()
  async {
    Apihelper apihelper = Apihelper();
    var p1 = await apihelper.getProductApi();
    productList = p1.map((e) => ProductModel.fromJson(e)).toList();
    print("${productList.length}====================================================");
    notifyListeners();
  }
}