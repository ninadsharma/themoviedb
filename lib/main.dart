import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/Provider/HomepageProvider.dart';
import 'package:themoviedb/Views/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DiscoverMoviesProvider(),
      child: CupertinoApp(
        title: 'Movies DB',
        debugShowCheckedModeBanner: false,
        home: MovieHome(),
        theme: const CupertinoThemeData(
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
