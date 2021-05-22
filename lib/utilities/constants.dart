import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final BoxDecoration kcardHolderStyle = BoxDecoration(
  image: DecorationImage(
    fit: BoxFit.cover,
    image: AssetImage("images/cardbg2.png"),
    //image: new NetworkImage("https://digitalsynopsis.com/wp-content/uploads/2017/07/beautiful-color-ui-gradients-backgrounds-roseanna.png")
  ),
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow:[
    BoxShadow(
      color: Colors.black54,
      offset: Offset(2.0, 3.0), //(x,y)
      //spreadRadius: 2,
      blurRadius: 4.0,
    ),
  ],
);

const TextStyle kcardHolderNameTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle kcardBalanceHeadingTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 40,
  fontWeight: FontWeight.bold,
);

final TextStyle kcategoryTextStyle = GoogleFonts.kaushanScript(
     textStyle: TextStyle(
       color: Colors.white,
       fontSize: 35,
       fontWeight: FontWeight.bold,
       fontStyle: FontStyle.italic,
)) ;

final TextStyle kcardcategoryTypeStyle = GoogleFonts.dancingScript(
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.bold,
      //fontStyle: FontStyle.italic,
    )) ;

const List<String> imageUrls = [
  "https://images.unsplash.com/photo-1544148103-0773bf10d330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://www.ventureinsights.com.au/wp-content/uploads/2021/03/1.jpg",
  "https://wallpapercave.com/wp/uCZRN5a.jpg",
  "https://www.lucova.com/blog/wp-content/uploads/2015/06/mobile-pay.jpg",
  "https://g.foolcdn.com/image/?url=https%3A//g.foolcdn.com/editorial/images/552424/gettyimages-515778474.jpg&w=2000&op=resize"
];