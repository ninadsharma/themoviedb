import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/Provider/HomepageProvider.dart';
import 'package:themoviedb/Provider/SearchProvider.dart';
import 'package:themoviedb/Views/HomePage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SearchMoviesProvider>(
          create: (_) => SearchMoviesProvider()),
      ChangeNotifierProvider<DiscoverMoviesProvider>(
          create: (_) => DiscoverMoviesProvider()),
    ],
    child: MoviesDBApp(),
  ));
}

class MoviesDBApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Movies DB',
      debugShowCheckedModeBanner: false,
      home: MovieHome(),
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
