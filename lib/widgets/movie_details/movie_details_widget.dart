import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_info_widget.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_main_screen_cast_widget.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mortal Kombat'),
      ),
      body: ColoredBox( // задает цвет страницы
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            MovieDetailsMainInfoWidget(),
            SizedBox(height: 30,),
            MovieDetailsMainScreenCastWidget()
          ],
        ),
      ),
    );
  }
}
