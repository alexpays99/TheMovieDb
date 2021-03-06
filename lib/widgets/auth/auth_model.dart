import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/data_providers/session_data_provider.dart';
import 'package:themoviedb/widgets/navigation/main_navigation.dart';


class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  String? _errorMessage = null;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(username: login, password: password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.Network:
          _errorMessage = 'Сервер не доступен. Проверте подключение к интернету';
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage = 'Неправильный логин или пароль!';
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = 'Произошла ошибка. Попробуйте ещё раз';
          break;
      }
    } 
    _isAuthProgress = false;

    if (_errorMessage != null) {
      notifyListeners();
      return;
    }

    if (sessionId == null) {
      _errorMessage = 'Неизвестная ошибка, повторите попытку';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    unawaited(Navigator.of(context).pushReplacementNamed(MainNavigationRouteNames.mainScreen));
  }
}

// class AuthProvider extends InheritedNotifier {
//   final AuthModel model;
//   const AuthProvider({Key? key, required this.model, required this.child})
//       : super(key: key, notifier: model, child: child);

//   final Widget child;

//   static AuthProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
//   }

//   static AuthProvider? read(BuildContext context) {
//     final widget =
//         context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
//     return widget is AuthProvider ? widget : null;
//   }

//   static AuthProvider? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
//   }

//   @override
//   bool updateShouldNotify(AuthProvider oldWidget) {
//     return true;
//   }
// }

// class NotifierProvider<Model extends ChangeNotifier> extends InheritedNotifier {
//   final Model model;
//   const NotifierProvider({Key? key, required this.model, required this.child})
//       : super(key: key, notifier: model, child: child);

//   final Widget child;

//   static Model? watch<Model extends ChangeNotifier>(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<NotifierProvider<Model>>()?.model;
//   }

//   static Model? read<Model extends ChangeNotifier>(BuildContext context) {
//     final widget =
//         context.getElementForInheritedWidgetOfExactType<NotifierProvider<Model>>()?.widget;
//     return widget is NotifierProvider<Model> ? widget.model : null;
//   }

//   static NotifierProvider? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<NotifierProvider>();
//   }

//   @override
//   bool updateShouldNotify(NotifierProvider oldWidget) {
//     return true;
//   }
// }