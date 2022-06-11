import 'package:flutter/material.dart';


final Color baseIconsColor = Colors.white;
final Color mainBackgroundColor = Colors.teal.shade900;
final Color cardItemColor = Colors.teal.shade600.withOpacity(0.9);
final Color baseTextItemColor = Colors.grey.shade200;
final Color floatingBtnColor = Colors.grey.shade400;
final Color calcBtnColor = Colors.red.shade300;

const String language = "ar";


// Api Ex..
// baseURL= "https://newsapi.org/";
// method="v2/top-headlines";
// queries={
// "country":"eg",
// "category":"business",
// "apiKey":"9e94d2799d4a48fe872d43f70f48a274",
// }
// "country=us&category=business&apiKey=9e94d2799d4a48fe872d43f70f48a274";
String allURL1 =
    "https://newsapi.org/ v2/top-headlines? country=eg & apiKey=9e94d2799d4a48fe872d43f70f48a274";
String allURL2 =
    "https://newsapi.org/ v2/top-headlines? country=eg & category=business &apiKey=9e94d2799d4a48fe872d43f70f48a274";
String allURL3 =
    "https://newsapi.org/ v2/top-headlines? country=eg & category=science &apiKey=9e94d2799d4a48fe872d43f70f48a274";
String allURL4 =
    "https://newsapi.org/ v2/top-headlines? country=eg & category=sports &apiKey=9e94d2799d4a48fe872d43f70f48a274";
String mainURL =
    "https://newsapi.org/v2/everything?q=tesla&from=2022-03-01&sortBy=publishedAt&apiKey=9e94d2799d4a48fe872d43f70f48a274";


