import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPostersWidget(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _DescriptionWidget(),
        ),
        SizedBox(height: 30,),
        _PeopleWidgets(),
      ],
    );
  }

  Text _OverviewWidget() {
    return Text(
          'Overview',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400, 
            fontSize: 16
          ),
        );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Основано на цикле романов Айзека Азимова. В далёком будущем люди расселились за пределами Земли. Однако Галактическая империя грозит рухнуть, согласно расчётам ученого Гэри Селдона. И он создаёт организацию «Основание», призванную восстановить человеческую цивилизацию после грядущих потрясений. Далекое будущее наступило. Теперь в Галактике существует единая Империя, ею правит император, и надеется в дальнейшем удержать строй здешнего человечества в своей власти. Он руководит многими людьми, улучшает технологии с помощью знаний нынешних ученых. Но появился человек, который неожиданно начал разбираться в будущем. Он увидел в видениях, что всё королевство сгорело в огне, и навестить нависла над их территорией. Он пытается побороть эти страхи, но ничего не выходит.',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400, 
        fontSize: 16
      ),
    );
  }
}

class _TopPostersWidget extends StatelessWidget {
  const _TopPostersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage(AppImages.ana2)),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(image: AssetImage(AppImages.ana)),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Anna Clancy`s Without Remorse', 
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          ),
          TextSpan(
            text: ' (2021)', 
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ]
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {}, 
          child: Row(
            children: [
              Icon(Icons.score),
              Text('User Score'),
            ],
          ),
        ),
        Container( // width 1 и height 15  это разделитель "|" между кнопками User Score и Play Trailer
          width: 1,
          height: 15,
          color: Colors.grey,
        ),
        TextButton(
          onPressed: () {}, 
          child: Row(
            children: [
              Icon(Icons.play_arrow),
              Text('Play Trailer'),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          'TV-14 НФ и Фэнтези, драма 1h 9m',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400, 
            fontSize: 16
          ),
        ),
      ),
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400, 
      fontSize: 16
    );
    final jobTitleStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400, 
      fontSize: 16
    );

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Maite Perroni', style: nameStyle,),
                Text('Adriana', style: jobTitleStyle,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Maite Perroni', style: nameStyle),
                Text('Adriana', style: jobTitleStyle,),
              ],
            )
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Maite Perroni', style: nameStyle),
                Text('Adriana', style: jobTitleStyle,),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Maite Perroni', style: nameStyle),
                Text('Adriana', style: jobTitleStyle,),
              ],
            )
          ],
        ),
      ],
    );
  }
}