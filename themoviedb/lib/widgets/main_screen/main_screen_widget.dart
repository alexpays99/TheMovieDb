import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/domain/data_providers/session_data_provider.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_model.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';
import 'package:themoviedb/widgets/navigation/main_navigation.dart';
import 'package:themoviedb/widgets/news/news_list_widget.dart';
import 'package:themoviedb/widgets/tv_show_list/tv_show_list.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index)
      return; // если индекс выделеной вкладки равен вкладке на которой он сейчас находится, то из функции делаем ранний выход и не будем обновлять State если вкладка уже выбрана
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<MainScreenModel>(context);
    print(model);
    return Scaffold(
        appBar: AppBar(
          title: Text('TMDB'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Open shopping cart',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Open shopping cart',
              onPressed: () {
                SessionDataProvider().setSessionId(null);
                Navigator.of(context).pushNamed(MainNavigationRouteNames.auth);
              },
            ),
          ],
        ),
        body: IndexedStack(
          //чтобы после переключения между вкладками "Новости", "Фильмы" и "Сериалы" сохранялось состояние на предыдущей вкладке, которое было до переключения, попестим эти виджеты в IndexedStack. Т. е. в этом виджете все 3 вкладки существуют одновременно, просто отображается только один из них на данный момент времени. При переключении между ними никакой из них из памяти не удаляется и не удаляется их состояние. Этот способ зфанимает больше памяти, но зато не делает лишних действий
          index:
              _selectedTab, // показывает виджет, который в данный момент будет показывать
          children: [
            NewsListWidget(),
            MovieListWidget(),
            TvShowListWidget(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:
              _selectedTab, // выбраный элемент, который стоит под индеком _selectedTab
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Новости',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter),
              label: 'Фильмы',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Сериалы',
            ),
          ],
          onTap: onSelectTab,
        ));
  }
}
