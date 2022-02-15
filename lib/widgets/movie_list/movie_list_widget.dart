import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_mode.dart';
import 'package:themoviedb/widgets/navigation/main_navigation.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if (model == null) return SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                .onDrag, // убирается клавиатуру как только начинается скролл
            itemCount: model
                .movies.length, // показывает кол-во фильмов в массиве _movies
            itemExtent: 160,
            itemBuilder: (BuildContext context, int index) {
              model.showedMovieAtIndex(index);
              final movie = model.movies[
                  index]; // переменная с конкретным текущим фильмом, который должен отображаться
              final posterPath = movie.posterPath;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          //Image(image: AssetImage(movie.imageName),),
                          posterPath != null
                              ? Image.network(
                                  ApiClient.imageUrl(posterPath),
                                  width: 95,
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            width: 15,
                          ), // отступ колонки с описанием от картинки
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  model.stringFromDate(movie.releaseDate),
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.overview,
                                  maxLines:
                                      2, //максимума 2 строки текста в колонке
                                  overflow: TextOverflow
                                      .ellipsis, //ставит ... когда текст переполняет 2 строки
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ), // отступ колонки с описанием от края колонки
                        ],
                      ),
                    ),
                    // виджет Material специально для виджета InkWell. InkWell нужен для того чтобы сделать всю карточку с информацией кликабельной.
                    Material(
                      color: Colors
                          .transparent, // по дефолту он затмевает весь контент белым цветом. чтобы это исправить, виджету Material ставится прозрачный цвет
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => model.onMovieTap(context, index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onChanged: model.searchMovie,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor:
                  Colors.white.withAlpha(235), // делает поиск полупрозрачным
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
