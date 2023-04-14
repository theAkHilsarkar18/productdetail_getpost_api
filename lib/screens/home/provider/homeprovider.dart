import 'package:flutter/widgets.dart';
import 'package:productdetail_getpost_api/screens/home/model/homemodel.dart';
import 'package:productdetail_getpost_api/utils/apihelper.dart';

class Homeprovider extends ChangeNotifier
{
  List<ProductModel> productList = [];
  Future<void> productApiCalling()
  async {
    Apihelper apihelper = Apihelper();
    productList = await apihelper.getProductApi();
    print("${productList.length}========================================");
    notifyListeners();
  }

  Future<String> postApiCalling(String name,String rate,String price, String offer,String desc)
  async {
    String msg = await Apihelper().postProductApi(name, rate, price, offer, desc);
    return msg;
  }


  List imgList = [
    "assets/m2.jpg",
    "assets/m6.jpeg",
    "assets/x1.png",
    "assets/x2.jpg",
    "assets/x3.jpg",
    "assets/x4.jpg",
    "assets/x6.jpeg",
    "assets/m.jpg",
    "assets/m3.jpeg",
    "assets/m4.png",
    "assets/m5.jpeg",
    "assets/m2.jpg",
    "assets/m6.jpeg",
    "assets/x1.png",
    "assets/x2.jpg",
    "assets/x3.jpg",
    "assets/x4.jpg",
    "assets/x6.jpeg",
    "assets/m.jpg",
    "assets/m3.jpeg",
    "assets/m4.png",
    "assets/m5.jpeg",
    "assets/m2.jpg",
    "assets/m6.jpeg",
    "assets/x1.png",
    "assets/x2.jpg",
    "assets/x3.jpg",
    "assets/x4.jpg",
    "assets/x6.jpeg",
    "assets/m.jpg",
    "assets/m3.jpeg",
    "assets/m4.png",
    "assets/m5.jpeg",
    "assets/m2.jpg",
    "assets/m6.jpeg",
    "assets/x1.png",
    "assets/x2.jpg",
    "assets/x3.jpg",
    "assets/x4.jpg",
    "assets/x6.jpeg",
    "assets/m.jpg",
    "assets/m3.jpeg",
    "assets/m4.png",
    "assets/m5.jpeg",
  ];

}