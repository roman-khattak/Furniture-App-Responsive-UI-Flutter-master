import 'package:flutter/material.dart';

import '../size_config.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {   // This is not an extracted Method but an extracted Widget from the Text Widget and named as 'TitleText'
    double defaultSize = SizeConfig.defaultSize;
    return Text(
      title!,
      style: TextStyle(
        fontSize: defaultSize * 1.6, // the font size becomes 16 for iphone 11 preview
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
