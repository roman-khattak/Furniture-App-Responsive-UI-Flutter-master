import 'package:flutter/material.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/details/details_screen.dart';

import '../../../size_config.dart';
import 'product_card.dart';


class RocommendedProducts extends StatelessWidget {
  const RocommendedProducts({
    super.key,
    required this.products,
  });

  // our API provides a list of products so we pass that list here
  final List<Product> products;

  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),  // 20 padding for iphone 11
      child: GridView.builder(
        // for demo we take two objects
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:  SizeConfig.orientation == Orientation.portrait ? 2 : 4,  //  in "SizeConfig" file we have the orientation of device available using mediaQueries
            childAspectRatio: 0.693,  // this aspect ratio will make the size of product Card better, i.e., equal to it's parent
            mainAxisSpacing: 20,
            crossAxisSpacing: 20
        ),
        physics: NeverScrollableScrollPhysics(),   // we turn off the GridView scroll because we already have scroll enabled on the screen
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            ProductCard(
                product: products[index],  // the whole 'product' object is sent to the "ProductCard"
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailsScreen(product: products[index]);  // Passing each product index-wise to the Details screen to display thus if you click on a product its that specific product will be passed to the DeataisScreen to Display
                  },));
                }
            ),

      ),
    );
  }
}

