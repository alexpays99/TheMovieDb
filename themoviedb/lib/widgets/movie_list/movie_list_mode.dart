import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entity/movie.dart';
import 'package:themoviedb/widgets/navigation/main_navigation.dart';
import 'package:intl/intl.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat? _dateFormat = DateFormat.yMMMMd();
  late String _locale = '';

  String stringFromDate(DateTime? date) => date != null
      ? _dateFormat!.format(date)
      : ''; //DateFormat будет создаваться один раз, а не каждый раз когда нам нужно.

  // настройка локали
  void setupLocale(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if(_locale != locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(_locale);
    _movies.clear(); // удаляет все фильмы со списка со старой локалью
    loadMovies(); // перезагружает заново список популярных фильмов с новой локалью
  }

  Future<void> loadMovies() async {
    final moviesResponce = await _apiClient.popularMovie(1, _locale);
    _movies.addAll(moviesResponce.movies);
    notifyListeners();
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }
}
