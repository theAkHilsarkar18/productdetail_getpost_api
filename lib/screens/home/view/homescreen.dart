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


    TextEditingController txtName = TextEditingController(text: "A iPhone14 Pro");
    TextEditingController txtPrice = TextEditingController(text: "1,75,000");
    TextEditingController txtDisc = TextEditingController(text: "1200");
    TextEditingController txtDesc = TextEditingController(text: "16 GB RAM, 512 GB Storage");
    TextEditingController txtRating = TextEditingController(text: "4.5");

    homeproviderFalse = Provider.of<Homeprovider>(context, listen: false);
    homeproviderTrue = Provider.of<Homeprovider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(30),side: BorderSide(color: Color(0xff251B37),width: 1.5)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: txtName,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.tag,color: Color(0xff251B37)),
                            label: Text("Product name",style: TextStyle(color: Color(0xff372948))),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                          ),
                        ),
                        SizedBox(height: 8,),
                        TextField(
                          controller: txtPrice,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.price_change_outlined,color: Color(0xff251B37)),
                            label: Text("Product price",style: TextStyle(color: Color(0xff372948))),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                          ),
                        ),
                        SizedBox(height: 8,),
                        TextField(
                          controller: txtDisc,
                          decoration: InputDecoration(
                            label: Text("Product discount",style: TextStyle(color: Color(0xff372948))),
                            prefixIcon: Icon(Icons.discount_outlined,color: Color(0xff251B37)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                          ),
                        ),
                        SizedBox(height: 8,),
                        TextField(
                          controller: txtDesc,
                          decoration: InputDecoration(
                            label: Text("Product description",style: TextStyle(color: Color(0xff372948))),
                            prefixIcon: Icon(Icons.description_outlined,color: Color(0xff251B37)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                          ),
                        ),
                        SizedBox(height: 8,),
                        TextField(
                          controller: txtRating,
                          decoration: InputDecoration(
                            label: Text("Product rating",style: TextStyle(color: Color(0xff372948))),
                            prefixIcon: Icon(Icons.star_half,color: Color(0xff251B37)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff251B37))),
                          ),
                        ),
                        SizedBox(height: 12,),
                        InkWell(onTap: () async{
                          String name  = txtName.text;
                          String rate  = txtRating.text;
                          String price  = txtPrice.text;
                          String offer  = txtDisc.text;
                          String desc  = txtDesc.text;
                          String msg = await homeproviderFalse!.postApiCalling(name, rate, price, offer, desc);
                          homeproviderFalse!.productApiCalling();
                          print("${msg}====================================================================");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$msg")));
                          Navigator.pop(context);
                        },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Color(0xff251B37),width: 1.5),
                            ),
                            alignment: Alignment.center,
                            child: Text("Submit",style: TextStyle(color: Color(0xff251B37),fontWeight: FontWeight.w500,fontSize: 15),),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 0.5, color: Colors.grey.shade300)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Color(0xff251B37),
                            Color(0xff372948),
                          ],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Icon(Icons.add, color: Colors.white, size: 25),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VerticalDivider(),
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        width: 200,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(10),
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(

                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  Color(0xff251B37),
                                  Color(0xff372948),
                                ],
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                    "${homeproviderTrue!.imgList[index]}",
                                    fit: BoxFit.cover)),
                          ),
                          itemCount: homeproviderTrue!.productList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(

                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "${homeproviderTrue!.imgList[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${homeproviderTrue!.productList[index].productName}",
                            style: TextStyle(
                                color: Color(0xff251B37),
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Text("${homeproviderTrue!.productList[index].productPrice}/-",
                                style: TextStyle(
                                    color: Color(0xff251B37),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 40,
                            ),
                            Text("${homeproviderTrue!.productList[index].productOffer} Off",
                                style: TextStyle(
                                    color: Color(0xff251B37),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                            Spacer(),
                            Text("${homeproviderTrue!.productList[index].productRate}",
                                style: TextStyle(
                                    color: Color(0xff251B37),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                            Icon(
                              Icons.star_half,
                              color: Color(0xff251B37),
                              size: 17,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  itemCount: homeproviderTrue!.productList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
