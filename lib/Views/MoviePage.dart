import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:themoviedb/Model/movieModel.dart';
import 'package:themoviedb/Provider/AppConfigs.dart';

class MoviePage extends StatelessWidget {
  MovieModel? movie;
  MoviePage({this.movie});

  @override
  Widget build(BuildContext context) {
    Sizes(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: height * 0.4,
              width: width,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: height * 0.4,
                      width: width,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.network(
                          "${AppConfig().imageBaseUrl}${movie!.posterPath}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: height * 0.01,
                      left: width * 0.01,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.back,
                          color: Colors.white,
                          size: 16,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: marginH, vertical: marginV),
              padding: EdgeInsets.all(paddingH),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    "${movie!.title}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "In cinemas from: ${movie!.releaseDate}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Overview",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${movie!.overview}",
                    maxLines: movie!.overview!.length,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: height * 0.08,
                    width: height * 0.08,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white38),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.hand_thumbsup,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(height: 4),
                          Text("${movie!.voteCount} Likes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8))
                        ])),
                Container(
                    height: height * 0.08,
                    width: height * 0.08,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white38),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.hand_thumbsdown,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(height: 4),
                          Text("Dislike",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8))
                        ])),
                Container(
                    height: height * 0.08,
                    width: height * 0.08,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white38),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(height: 4),
                          Text("${movie!.voteAverage} Votes",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 8))
                        ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}
