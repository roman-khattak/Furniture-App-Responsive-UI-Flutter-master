import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';

import 'components/body.dart';



class DetailsScreen extends StatelessWidget {

  final Product product;   // we have to receive each individual 'product' passed here from home screen's "RecommendedProducts" class to display

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);     // we use data from this class to ensure Responsiveness.

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);    // Go back
        },
      ),
      actions: <Widget>[    // These Widgets are displayed at the end of appBar in Trailing area
        IconButton(
          icon: SvgPicture.asset("assets/icons/bag.svg"),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}

