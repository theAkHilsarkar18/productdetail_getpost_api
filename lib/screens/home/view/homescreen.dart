import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homeprovider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  Homeprovider? homeproviderFalse;
  Homeprovider? homeproviderTrue;

  @override
  void initState() {
    super.initState();
    Provider.of<Homeprovider>(context, listen: false).productApiCalling();
  }

  @override
  Widget build(BuildContext context) {

    homeproviderFalse = Provider.of(context,listen: false);
    homeproviderTrue = Provider.of(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("${homeproviderTrue!.productList.length}"),
        ),
      ),
    );
  }
}
