import 'package:flutter/cupertino.dart';

class AppConfig {
  String baseUrl = 'https://api.themoviedb.org/3/';
  // discover/movie?api_key=135403b3eff57d396b63f27b027c0d4e&language=en-US&sort_by=primary_release_date.desc&include_adult=true&include_video=true&page=1
  String moviesKey = '135403b3eff57d396b63f27b027c0d4e';
  String imageBaseUrl = 'https://api.themoviedb.org/';
}

late double height, width, marginH, marginV, paddingH, paddingV;

class Sizes {
  Sizes(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    paddingH = width * 0.02;
    marginH = width * 0.01;
    paddingV = height * 0.02;
    marginV = height * 0.01;
  }
}
