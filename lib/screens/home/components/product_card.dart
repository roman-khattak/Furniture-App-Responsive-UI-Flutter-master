import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.press,
  });

  final Product product;  // this product object is received here and we will extract the products from it index-wise
  final void Function() press;  // the 'press' declaration is a non-nullable function. But do it if you are confident that press will always have a value and will never be null, you can update the declaration to ensure non-nullability. We pass the on-Tap on objects also from the main component on which the user 'Clicks'


  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize;

    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5,  // 145 width dynamically given to the RecommendedProducts container
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),

        // The "AspectRatio" widget is used to constrain its child's aspect ratio to a specific value.
        // The aspect ratio is the ratio of the width to the height.
        // In this case, "aspectRatio: 1" sets the aspect ratio to 1:1, making the widget a square.
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              Hero(
                tag: product.id!,
                child: FadeInImage.assetNetwork( // It's useful for showing a placeholder image while the actual image is being fetched from the network. The FadeInImage.assetNetwork widget displays an image from a network URL with a smooth fade-in animation when the image is loaded.
                  placeholder: "assets/spinner.gif",   //This line sets the asset path for the placeholder image that is shown while the actual image is being loaded.
                  image: product.image!, //This line specifies the URL of the image to be displayed.  It uses the product.image variable, which must be a non-null value.
                  fit: BoxFit.cover,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleText(title: product.title,),  // Here we have 'extracted a widget' from Text widget and named it as TitleText
              ),

              SizedBox(height: defaultSize / 2,),
              Text("\$${product.price}"),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
