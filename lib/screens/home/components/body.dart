//
// // ... This is a component called 'Body' that belongs to the home Screen therefore we have place it inside the 'components' folder in 'home' folder

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/screens/home/components/recommended_products.dart';
import 'package:furniture_app/services/fetchCategories.dart';
import 'package:furniture_app/services/fetchProducts.dart';
import 'package:furniture_app/size_config.dart';

import '../../../components/title_text.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;    // It help us to  make our UI responsive
    return SingleChildScrollView(      // It enables scrolling over the column
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(defaultSize * 2),   //padding here is 20 according to iphone 11 preview ( it will adjust according to different screens)
                child: TitleText(title: "Browse by Categories"),   // Here we have 'extracted a widget' from Text widget and named it as TitleText
              ),

              FutureBuilder(
                  future: fetchCategories(), // calling API function
                  builder: (context, snapshot) => snapshot.hasData
                      ? Categories(categories: snapshot.data!,)   // passing the 'list of categories' from API to the 'categories' Argument below
                      : Center(child: Image.asset("assets/ripple.gif")),
              ),

              Divider(height: 5,),   // The 'CategoryCard' generated from 'Categories' class has external padding of 20 on all sides that's why the divider has separation from the 'CategoryCards'

              Padding(
                padding: EdgeInsets.all(defaultSize * 2),   // 20 padding externally to the TitleText widget below
                child: TitleText(title: "Recommended for you",),    // TitleText widget gives the format of Title to the Text
              ),


             FutureBuilder(
                 future: fetchProducts(),  // in future we will have a list of type Product Returned from this method
                 builder: (context, snapshot) {
                  return snapshot.hasData
                       ?  RocommendedProducts(products: snapshot.data!,)
                       :  Center(child: Image.asset('assets/ripple.gif'));
                 },
             )

            ],
          ),
        )
    );
  }
}

