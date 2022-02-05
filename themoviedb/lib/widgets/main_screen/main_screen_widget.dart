import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/movie_list/movie_list_widget.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text('TMDB'),
        ),
        body: IndexedStack( //чтобы после переключения между вкладками "Новости", "Фильмы" и "Сериалы" сохранялось состояние на предыдущей вкладке, которое было до переключения, попестим эти виджеты в IndexedStack. Т. е. в этом виджете все 3 вкладки существуют одновременно, просто отображается только один из них на данный момент времени. При переключении между ними никакой из них из памяти не удаляется и не удаляется их состояние. Этот способ зфанимает больше памяти, но зато не делает лишних действий
          index: _selectedTab, // показывает виджет, который в данный момент будет показывать
          children: [
            Text(
              'Новости',
            ),
            MovieListWidget(),
            Text(
              'Сериалы',
            ),
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
