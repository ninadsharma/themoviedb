import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/Model/movieModel.dart';
import 'package:themoviedb/Provider/AppConfigs.dart';
import 'package:themoviedb/Provider/SearchProvider.dart';
import 'package:themoviedb/Views/MoviePage.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  TextEditingController searchText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Sizes(context);

    Provider.of<SearchMoviesProvider>(
      context,
      listen: false,
    ).searchMovies(searchText.text.trim());
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: CupertinoNavigationBar(
          middle: CupertinoTextField(
            autofocus: true,
            controller: searchText,
            onChanged: (String value) {
              Provider.of<SearchMoviesProvider>(context, listen: false)
                  .searchMovies(value.trim());
            },
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 16,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: const Icon(
              CupertinoIcons.check_mark,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        body: Consumer<SearchMoviesProvider>(
          builder: (context, value, child) {
            if (value.searchedMovies!.isEmpty) {
              return const Center(
                  child: Text(
                "Please enter keywords to search",
                style: TextStyle(color: Colors.white60),
              ));
            } else {
              List<MovieModel?>? movies = value.searchedMovies;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: movies!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => MoviePage(
                                      movie: movies[index],
                                    )));
                      },
                      child: Container(
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
                                    child: movies[index]!.posterPath == null
                                        ? const Text("Image not found")
                                        : Image.network(
                                            "${AppConfig().imageBaseUrl}${movies[index]!.posterPath}",
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.only(right: paddingH),
                                        width: width * 0.6,
                                        child: Text(
                                          "${movies[index]!.title}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
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
                      ),
                    );
                  });
            }
          },
        ));
  }
}
