import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';

import 'product_description.dart';
import 'product_info.dart';



class Body extends StatelessWidget {
  final Product? product;   // for extracting details from the selected product we have to send the product details here as well for that we need to pass the product object here

  const Body({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;     // declared to ensure responsiveness

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        // In this way the AppBar's height is subtracted from teh height of Body Container and thus the scrolling effect also is removed from it as the screen gets tight and looks better
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(  // Column/Stack wrapped with SingleChildScrollView compliments the 'minHeight' in BoxConstraints
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(product: product!),   // This 'product' object is passed to the 'ProductInfo' class to extract data from it and show
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product!,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 7.5,

              // This 'Hero' widget brings animation to the image like 'FadeIn' and 'FadeOut' because We have also wrapped "FadeInImage" widget with Hero Widget in 'ProductCard' screen and we have also passed same tag as 'product.id' to both
              // Hero animations primarily focus on transitioning between screens with the same tag,  and any fade-in or fade-out effects could be related to image loading behavior or widget animations within the screens.
              //If you are observing a fade-in/fade-out effect, it could be related to the "FadeInImage.assetNetwork" widget itself in 'ProductCard' Screen, which is used within the "ProductCard" widget.
              // The FadeInImage.assetNetwork widget is designed to provide a smooth fade-in animation when the actual image is loaded from the network.
              // If the network image takes some time to load, you will observe the fade-in animation.

              child: Hero(
                tag: product!.id!,
                child: Image.network(
                  product!.image!,
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8, //378
                  width: defaultSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


