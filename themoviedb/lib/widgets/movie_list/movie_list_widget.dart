import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String desctiption;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.desctiption,
  });
}

class MovieListWidget extends StatefulWidget { 

  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  //массив с фильмами
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.moviePlaceholder,
      title: 'Mortal Kombat',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 2,
      imageName: AppImages.moviePlaceholder,
      title: 'Прибытие',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 3,
      imageName: AppImages.moviePlaceholder,
      title: 'Back to the future 2',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 4,
      imageName: AppImages.moviePlaceholder,
      title: 'Back to the future',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 5,
      imageName: AppImages.moviePlaceholder,
      title: 'Mortal Kombat',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 6,
      imageName: AppImages.moviePlaceholder,
      title: 'Mortal Kombat',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 7,
      imageName: AppImages.moviePlaceholder,
      title: 'Mortal Kombat',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 8,
      imageName: AppImages.moviePlaceholder,
      title: 'Mortal Kombat',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 9,
      imageName: AppImages.moviePlaceholder,
      title: 'Iron man',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 10,
      imageName: AppImages.moviePlaceholder,
      title: 'Смертельная битва',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 11,
      imageName: AppImages.moviePlaceholder,
      title: 'Alien',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 12,
      imageName: AppImages.moviePlaceholder,
      title: 'Alien 2',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 13,
      imageName: AppImages.moviePlaceholder,
      title: 'Spider man',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 14,
      imageName: AppImages.moviePlaceholder,
      title: 'Смертельная битва',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
    Movie(
      id: 15,
      imageName: AppImages.moviePlaceholder,
      title: 'Смертельная битва',
      time: 'April 27 2021',
      desctiption: 'asfasdfasydfhasiodyfaasdl;fjasdklfhasdfsadgfdsf sdf uisysadiufysaduiof sadyfoi asdiufy suiodayf oiausdy fsadfuiasdyo fsdadfhsdf uasdhfasdyof7sadofasdf hsadf iasudhfos dafuygasdfsdi sidf sdf yas8d7fy as8dfy -as9dyf0asdhf0asdyfsadfas0df s80d7fy 6asdfsdf sf',
    ),
  ];

  var _filteredMovies = <Movie>[]; // отфильтрованный список фильмов

  final _searchController = TextEditingController(); // конктроллер поиска

  // функция посика филмов
  void _searchMovies() {
    final query = _searchController.text; // текст, который пользователь вводит в поиск
    if(query.isNotEmpty) { // если текст, который пользователь вводит в поиск не пустое поле
      _filteredMovies = _movies.where((Movie movie) { //в отфильтрованный список фильмов положить результаты из массива _movies, в котором вызывается замыкание с элементом movie и решается будет он попадать в отфильтрованый список или нет.
        return movie.title.toLowerCase().contains(query.toLowerCase()); // поиск происходит по названию фильма. строка, коротая смотрит содержит ли она внутри себя текст который ввел пользователь в поиск (query). если да, то возвращает только те фильмы которые ввел пользователь.
      }).toList();
    }
    else {
      _filteredMovies = _movies;
    }
    setState(() {}); // после того как обновится _filteredMovies обновляется состояние виджета и вызвать setState, чтобы флаттер понял что состояние изменилось и сделал перерисовку.
  }

  @override 
  void initState() {
    super.initState();
    //сначала отфильтрованый список с фильмами будет таким же как и весь список фильмов. потом вызывается _searchController, в который добавлен слушатель, который слушает "поиск".
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }
  // переход в карточку фильма при нажатии на него.
  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('/main_screen/movie_details', // навигатор контекста получает навигатор, потом пуши имя роута и передает в arguments id фильма
     arguments: id
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, // убирается клавиатуру как только начинается скролл
            itemCount: _filteredMovies.length, // показывает кол-во фильмов в массиве _movies
            itemExtent: 160,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index]; // переменная с конкретным текущим фильмом, который должен отображаться
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                          Image(
                            image: AssetImage(movie.imageName),
                          ),
                          SizedBox(
                            width: 15,
                          ), // отступ колонки с описанием от картинки
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.desctiption,
                                  maxLines: 2, //максимума 2 строки текста в колонке
                                  overflow: TextOverflow
                                      .ellipsis, //ставит ... когда текст переполняет 2 строки
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
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
                        onTap: () => _onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235), // делает поиск полупрозрачным
                border: OutlineInputBorder(),
              ),
            ),
          ),
      ],
    );
  }
}
