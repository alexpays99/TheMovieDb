import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/entity/movie.dart';
import 'package:themoviedb/domain/entity/popular_movie_responce.dart';
import 'package:themoviedb/widgets/navigation/main_navigation.dart';
import 'package:intl/intl.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late int _currentPage = 0;
  late int _totalPage = 1;
  var _isLoadingInProgress = false;
  String? _searchQuery;
  late String _locale = '';
  Timer? searchDeboubce; // задержка во премя поиска, чтобы запрос поиска фильмов не выполнялся после каждого введённого символа в поиска

  List<Movie> get movies => List.unmodifiable(_movies);
  late DateFormat? _dateFormat = DateFormat.yMMMMd();

  String stringFromDate(DateTime? date) => date != null
      ? _dateFormat!.format(date)
      : ''; //DateFormat будет создаваться один раз, а не каждый раз когда нам нужно.

  // настройка локали
  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale != locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(_locale);
    await _resetList();
  }

  Future<void> _resetList() async {
    _currentPage = 0;
    _totalPage = 1;
    _movies.clear(); // удаляет все фильмы со списка со старой локалью
    await loadNextPage(); // перезагружает заново список популярных фильмов с новой локалью
  }

  Future<PopularMovieResponce> _loadMovies(int nextPage, String locale) async {
    final query = _searchQuery;
    if (_searchQuery == null) {
      return await _apiClient.popularMovie(nextPage, _locale);
    } else {
      return await _apiClient.searchMovie(nextPage, locale, query!);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingInProgress || _currentPage >= _totalPage)
      return; // если загрузка ещё в процессе, то не будут загружаться новые страницы фильмов
    _isLoadingInProgress = true;
    final nextPage = _currentPage + 1;

    try {
      final moviesResponce = await _loadMovies(nextPage, _locale);
      _movies.addAll(moviesResponce.movies);
      _currentPage = moviesResponce.page;
      _totalPage = moviesResponce.totalPages;
      _isLoadingInProgress = false;
      notifyListeners();
    } catch (e) {
      _isLoadingInProgress = false;
    }
  }

//
  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.movieDetails, arguments: id);
  }

// поиск фильмов
  Future<void> searchMovie(String text) async {
    searchDeboubce?.cancel(); // отменяет таймер, который лежит в searchDeboubce на данный момент, а потом ложет туда новый. 
    searchDeboubce = Timer(const Duration(seconds: 1), () async { // поиск начнется через 1 секунду после того, как закончится ввод в поиск.
      final searchQuery = text.isNotEmpty ? text : null;
      if (_searchQuery == searchQuery) return;
      _searchQuery = searchQuery;
      await _resetList();
    });
  }

  void showedMovieAtIndex(int index) {
    if (index < _movies.length - 1) return;
    loadNextPage();
  }
}
