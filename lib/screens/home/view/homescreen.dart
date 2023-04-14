import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homeprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Homeprovider>(context, listen: false).productApiCalling();
  }
  Homeprovider? homeproviderFalse;
  Homeprovider? homeproviderTrue;
  @override
  Widget build(BuildContext context) {

    homeproviderFalse = Provider.of<Homeprovider>(context,listen: false);
    homeproviderTrue = Provider.of<Homeprovider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: double.infinity,
            color: Colors.red,
            child: Text("${homeproviderTrue!.productList[index].productName}"),
          );
        },itemCount: homeproviderTrue!.productList.length,),
        
      ),
    );
  }
}
