import 'package:flutter/material.dart';
import 'package:productdetail_getpost_api/screens/home/provider/homeprovider.dart';
import 'package:productdetail_getpost_api/screens/home/view/homescreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Homescreen(),
        },
      ),
    ),
  );
}