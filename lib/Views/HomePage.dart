import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/Model/movieModel.dart';
import 'package:themoviedb/Provider/AppConfigs.dart';
import 'package:themoviedb/Provider/HomepageProvider.dart';

class MovieHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Sizes(context);
    Provider.of<DiscoverMoviesProvider>(
      context,
      listen: false,
    ).fetchMovieModels();
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: const CupertinoNavigationBar(middle: Text("Discover Movies")),
        body: Consumer<DiscoverMoviesProvider>(
          builder: (context, value, child) {
            if (value.movies!.isEmpty) {
              return const Center(
                  child: CupertinoActivityIndicator(
                color: Colors.grey,
                radius: 16,
              ));
            } else if (value.movies!.isNotEmpty) {
              List<MovieModel?>? movies = value.movies;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: movies!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.24,
                      margin: EdgeInsets.symmetric(
                          horizontal: marginH, vertical: marginV),
                      padding: EdgeInsets.symmetric(
                          horizontal: paddingH, vertical: paddingV),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          color: Colors.black54,
                          border: Border.all(color: Colors.white38),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 8.0,
                                offset: Offset(0, 0),
                                color: Colors.white10,
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: Container(
                                      // child: Image.network(
                                      //     "${AppConfig().imageBaseUrl}${movies[index]!.posterPath}"),
                                      ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: paddingH),
                                      width: width * 0.6,
                                      child: Text(
                                        "${movies[index]!.title}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    Text(
                                      "In cinemas from: ${movies[index]!.releaseDate}",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Text(
                                    "${movies[index]!.overview}",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: Container(
                  color: Colors.red,
                  height: 40,
                  width: 50,
                ),
              );
            }
          },
        ));
  }
}
