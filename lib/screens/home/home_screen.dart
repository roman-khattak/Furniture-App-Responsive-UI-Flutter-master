import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/home/components/body.dart';
import 'package:furniture_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // It help us to  make our UI responsive
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(),  // App Bar is made Transparent by setting its color to transparent from "main.dart"
      body: Body(),  // the 'Body' is created as a separate component in the "components"folder and all components of 'Body' are also created in 'components' folder and called here
    );
  }

  AppBar buildAppBar() {    // this is an extracted method from AppBar whose return type is AppBar
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          height: SizeConfig.defaultSize * 2, // as on iphone 11 "SizeConfig.defaultSize is almost equal to 10" so now we want the icon size to be double of that thus we multiply it with 2 to get a height of '20' for the Svg image
        ),
        onPressed: () {},
      ),
      actions: <Widget>[   // 'actions' property is used in app bar to place an icon in teh trailing area
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/scan.svg",
            height: SizeConfig.defaultSize * 2.4, // here we have 'SizeConfig.defaultSize == 10 for iphone 11' thus by multiplying with 2.4 we get height of this icon as 24
          ),
          onPressed: () {},
        ),
        Center(
          child: Text(  // This text will appear parallel to the Scan icon in the trailing section of appBar
            "Scan",
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}

