import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';
import 'package:furniture_app/models/Categories.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


// The 'Container()' doesn't get displayed until the Stack is wrapped with AspectRatio is because AspectRatio enforces a specific aspect ratio for its child. In this case, the aspect ratio is set to 0.83.
//
// When the Stack is wrapped with AspectRatio, it adjusts its size to match the specified aspect ratio. Since there is no child widget within the Stack yet, Container doesn't have any size to be displayed. The Stack takes up the available space within the SizedBox based on the specified aspect ratio.

// By wrapping the Stack with AspectRatio, you ensure that the Stack maintains the specified aspect ratio even when child widgets are added or resized within it. This can be useful for achieving consistent and proportional layouts, especially when dealing with responsive designs.

// Aspect ratio refers to the proportional relationship between the width and height of an element or layout. It is typically expressed as a ratio, such as 16:9 or 4:3, where the first number represents the width and the second number represents the height.
//
// In the given code, aspectRatio: 0.83 means that the width of the widget is 0.83 times the height. It determines the shape or aspect ratio of the widget. In this case, the aspect ratio of 0.83 would result in a slightly wider and shorter widget compared to a perfect square (where the aspect ratio would be 1:1).
//  // Let's say the height of the widget is 100 units. In that case, the width will be calculated as 0.83 times the height, which is 0.83 * 100 = 83 units. So, the widget will have a width of 83 units and a height of 100 units, maintaining the specified aspect ratio.
//
// By setting the aspect ratio, you can control how the widget or layout should be proportionally sized. It can be useful in maintaining consistent and visually pleasing layouts, especially when working with images, videos, or responsive designs.


//..................................              ........................             ...........................

// this 'CategoryCard' was first written as normal code for an object in the 'body.dart' file then the code was 'Extracted as Widget' then was copied and brought to this separate file
class CategoryCard extends StatelessWidget {  // this is the widget I extracted so that I can use it in multiple places
  const CategoryCard({
    super.key,
    // It means we have to add the category
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding:  EdgeInsets.all(defaultSize * 2), // 20 padding externally ternally to separate the Cards from each other
      child: SizedBox(
        width: defaultSize * 20.5,  // making the sizedBox of width 205 (10 * 20.5 = 205) and at the same time we are providing it responsive width
        child: AspectRatio(
          aspectRatio: 0.83,  //aspectRatio: 0.83 means that the width of the widget is 0.83 times the height resulting in a slightly wider and shorter widget compared to a perfect square.
          // Let's say the height of the widget is 100 units. In that case, the width will be calculated as 0.83 times the height, which is 0.83 * 100 = 83 units. So, the widget will have a width of 83 units and a height of 100 units, maintaining the specified aspect ratio.
          child: Stack(
            alignment: Alignment.bottomCenter,  // This property will take only the smaller container to the bottom because the bigger one has already covered all space
            children: <Widget>[

              ClipPath(    // This is Custom Shape that's why we need to use ClipPath
                clipper: CategoryCustomShape(), // for creating the clip design
                child: AspectRatio(
                  aspectRatio: 1.025, // taking a little smaller container in the stack
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category.title,),
                        SizedBox(height: defaultSize,),
                        Text(
                          "${category.numOfProducts}+ Products",
                          style: TextStyle(color: kTextColor.withOpacity(0.6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(   // inside stack no need to give position to the image just align it to top and adjust by giving padding
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15, // taking image in even smaller container
                    child: FadeInImage.assetNetwork(   //  this will give a fade animation to image while loading
                        placeholder: "assets/spinner.gif",   // this is the custom CircularProgressIndicator image used over the 'category.image' to show loading effect
                        image: category.image!   // This is the image of chair coming from url with fade animation
                    ),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}

//Path path = Path();
// A new Path object is created. The Path class is used to describe a series of connected lines, curves, and arcs that form the custom shape.

// double height = size.height; and double width = size.width;
// The height and width variables are assigned the height and width of the widget that is being clipped. These values are retrieved from the Size parameter passed to the getClip method.

/// double cornerSize = 30;
// The cornerSize variable is set to 30. It represents the size of the curved corners in the custom shape. You can adjust this value to change the size of the corners.

//path.lineTo(0, height - cornerSize);
//..........................................
// This line moves the starting point of the path to the bottom-left corner of the widget. It starts from the point (0, height - cornerSize).

// path.quadraticBezierTo(0, height, cornerSize, height);
//..........................................
// This line adds a quadratic Bézier curve to the path. It creates a curve from the current point to the point (cornerSize, height). The control point (0, height) influences the curvature of the curve.

// path.lineTo(width - cornerSize, height);
//..........................................
// This line draws a straight line from the previous point to the bottom-right corner of the widget. The point (width - cornerSize, height) is reached.

// path.quadraticBezierTo(width, height, width, height - cornerSize);
//..........................................
// Another quadratic Bézier curve is added. It creates a curve from the previous point to the point (width, height - cornerSize). The control point (width, height) influences the curvature of the curve.

// path.lineTo(width, cornerSize);
//..........................................
// This line draws a straight line from the previous point to the top-right corner of the widget. The point (width, cornerSize) is reached.

// path.quadraticBezierTo(width, 0, width - cornerSize, 0);
//..........................................
// A quadratic Bézier curve is added to create a curve from the previous point to the point (width - cornerSize, 0). The control point (width, 0) influences the curvature of the curve.

// path.lineTo(cornerSize, cornerSize * 0.75);
//..........................................
// This line draws a straight line from the previous point to the top-left corner of the widget. The point (cornerSize, cornerSize * 0.75) is reached.

// path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
//..........................................
// Finally, a quadratic Bézier curve is added to create a curve from the previous point to the starting point (0, cornerSize * 2). The control point (0, cornerSize) influences the curvature of the curve.

// By combining straight lines and quadratic Bézier curves, the path creates a smooth curved shape that goes around the edges of the widget. The control points of the Bézier curves determine how much the curve bends and the direction of the curvature.

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}