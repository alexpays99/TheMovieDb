import 'dart:io';
import 'dart:convert';

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
    final url = Uri.parse('https://api.themoviedb.org/3/authentication/token/new?api_key=77a8c506fd7ef883f6b1e6c80fd4fbad');
    final request = await _client.getUrl(url);
    final responce = await request.close();
    final json = (await responce.jsonDecode()) as Map<String, dynamic>;
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    final url = Uri.parse('https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=77a8c506fd7ef883f6b1e6c80fd4fbad');
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

    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _makeSession({required String requestToken}) async {
    final url = Uri.parse('https://api.themoviedb.org/3/authentication/session/new?api_key=$_apiKey');
    final parameters = <String, dynamic>{'request_token': requestToken};

    final request = await _client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charser=UTF-8');
    request.write(jsonEncode(parameters));
     
    final responce = await request.close();
    final json = (await responce.jsonDecode()) as Map<String, dynamic>;

    final sessionId = json['session_id'] as String;
    return sessionId;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
