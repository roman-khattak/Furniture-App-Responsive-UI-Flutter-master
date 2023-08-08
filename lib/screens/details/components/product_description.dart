import 'package:flutter/material.dart';
import 'package:furniture_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;   // declared to ensure responsiveness
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),   // here we are telling compiler to keep minimum height this much otherwise max you can go as the size increases
      padding: EdgeInsets.only(
        top: defaultSize * 9, //90
        left: defaultSize * 2, //20
        right: defaultSize * 2,
      ),
      // height: 500,     // initially we make the height of container specific to complete our design then we make this height dynamic using constraints like "minHeight"
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.subTitle!,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            Text(
              product.description!,
              style: TextStyle(
                color: kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(defaultSize * 1.5), backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),

              //  onPressed: () => press!(),

                  // ... or ... //

                // If 'press' callback function is not null, the press function is invoked using the () => press!() syntax. If press is null, the onPressed property can be set to null, which disables the button or show any desired message.
                onPressed: () => press != null ? () => press!() : 'The press function is null in {product_design.dart Screen}',

                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defaultSize * 1.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )

            ),
          ],
        ),
      ),
    );
  }
}
