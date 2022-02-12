import 'dart:io';
import 'dart:convert';

enum ApiClientExceptionType { Network, Auth, Other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = '77a8c506fd7ef883f6b1e6c80fd4fbad';

  Future<String> auth(
      {required String username, required String password}) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = await _makeSession(requestToken: validToken);

    return sessionId;
  }

  Future<String> _makeToken() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key=77a8c506fd7ef883f6b1e6c80fd4fbad');
    try {
      final request = await _client.getUrl(url);
      final responce = await request.close();
      final json = (await responce.jsonDecode()) as Map<String, dynamic>;

      _validateResponce(responce, json);

      final token = json['request_token'] as String;
      return token;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow; // если здесь ошибка типа ApiClientException, то она просто опрокидывается выше
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType
          .Other); //если возника какая-то другия ошибка, отличная от SocketException или ApiClientException, то генерится тип ошибки ApiClientExceptionType.Other и передаёся наверх
    }
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=77a8c506fd7ef883f6b1e6c80fd4fbad');
      final parameters = <String, dynamic>{
        'username': username,
        'password': password,
        'request_token': requestToken
      };
      final request = await _client.postUrl(url);
      request.headers.set('Content-type', 'application/json; charser=UTF-8');
      request.write(jsonEncode(parameters));
      final responce = await request.close();
      final json = (await responce.jsonDecode()) as Map<String, dynamic>;

      _validateResponce(responce, json);

      final token = json['request_token'] as String;
      return token;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow; // если здесь ошибка типа ApiClientException, то она просто опрокидывается выше
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType
          .Other); //если возника какая-то другия ошибка, отличная от SocketException или ApiClientException, то генерится тип ошибки ApiClientExceptionType.Other и передаёся наверх
    }
  }

  Future<String> _makeSession({required String requestToken}) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/authentication/session/new?api_key=$_apiKey');
      final parameters = <String, dynamic>{'request_token': requestToken};

      final request = await _client.postUrl(url);
      request.headers.set('Content-type', 'application/json; charser=UTF-8');
      request.write(jsonEncode(parameters));

      final responce = await request.close();
      final json = (await responce.jsonDecode()) as Map<String, dynamic>;

      _validateResponce(responce, json);

      final sessionId = json['session_id'] as String;
      return sessionId;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow; // если здесь ошибка типа ApiClientException, то она просто опрокидывается выше
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType
          .Other); //если возника какая-то другия ошибка, отличная от SocketException или ApiClientException, то генерится тип ошибки ApiClientExceptionType.Other и передаёся наверх
    }
  }

  void _validateResponce(HttpClientResponse responce, Map<String, dynamic> json) {
    if (responce.statusCode == 401) {
      final dynamic status = json['status_code'];
      final code = status is int ? status : 0;
      if (code == 30) {
        throw ApiClientException(ApiClientExceptionType.Auth);
      }
      else {
        throw ApiClientException(ApiClientExceptionType.Other); // ошибка авторизации. она будет относится к типу ошибок ApiClientExceptionType.Other, поскольку если сгенерируется неправильный токен авторизации то пользователь ничего не сможет с этим сделать
      }
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => json.decode(v));
  }
}
