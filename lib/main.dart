import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // Here we set DM Sans as our default fonts
        // Now we also apply our text color to all flutter textTheme throughout the application
        textTheme:
            GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),

        // Almost all of our app bar have this style
        //The 'systemOverlayStyle' property in the AppBarTheme is used to define the appearance of the system overlays when the app bar is displayed. In this case, SystemUiOverlayStyle.dark is specified, which indicates that the system overlays (such as the status bar and navigation bar) will have a dark color scheme.
        //
        // When 'SystemUiOverlayStyle.dark' is used, the system overlays will typically have dark text and icons to ensure good visibility when the app bar has a light or transparent background.
        appBarTheme: AppBarTheme(
          color: Colors.transparent,   // this will make app bar transparent
          elevation: 0,  //By default, the app bar has a default 'elevation' value that creates a shadow effect to provide a sense of separation between the app bar and the content below it. However, by setting elevation to 0, the shadow effect is removed, and the app bar will appear as a flat, transparent element on the screen.
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),


        // The visualDensity property controls the density of spacing and layout of UI elements such as padding, margins, and sizes. It affects the overall look and feel of your app, making it appear more compact or more spacious.
        // By using visualDensity: VisualDensity.adaptivePlatformDensity in 'ThemeData', you allow Flutter to adapt the visual density of your app's UI elements based on the platform.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
