import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entity/movie.dart';
import 'package:themoviedb/widgets/navigation/main_navigation.dart';
import 'package:intl/intl.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadingInProgress = false;

  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat? _dateFormat = DateFormat.yMMMMd();
  late String _locale = '';

  String stringFromDate(DateTime? date) => date != null
      ? _dateFormat!.format(date)
      : ''; //DateFormat будет создаваться один раз, а не каждый раз когда нам нужно.

  // настройка локали
  void setupLocale(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale != locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(_locale);
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear(); // удаляет все фильмы со списка со старой локалью
    loadMovies(); // перезагружает заново список популярных фильмов с новой локалью
  }

  Future<void> loadMovies() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage) return; // если загрузка ещё в процессе, то не будут загружаться новые страницы фильмов
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final moviesResponce = await _apiClient.popularMovie(nextPage, _locale);
      _movies.addAll(moviesResponce.movies);
      _currentPage = moviesResponce.page;
      _totalPage = moviesResponce.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    loadMovies();
  }
}
