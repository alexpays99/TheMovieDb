import 'dart:io';
import 'dart:convert';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = '';

  // Future<List<Post>> getPost() async {
  //   final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //   final request = await client.getUrl(url);
  //   final responce = await request.close();
  //   final json = await responce
  //       .transform(utf8.decoder)
  //       .toList()
  //       .then((value) => value.join())
  //       .then((v) => jsonDecode(v) as List<dynamic>);
  //   final result = json.map((dynamic e) => Post.fromJson(e as Map<String, dynamic>)).toList();
  //   return result;
  // }

  // Future<List<Post>> crearePost({required String title, required String body}) async {
  //   final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //   final parameters = <String, dynamic> {
  //     'title': title,
  //     'body': body,
  //     'userId': 109
  //   };
  //   final request = await client.postUrl(url);
  //   request.headers.add('Content-type', 'application/json; charser=UTF-8');
  //   request.write(jsonEncode(parameters));
  //   final responce = await request.close();
  //   final string = await responce
  //       .transform(utf8.decoder)
  //       .toList()
  //       .then((value) => value.join());
  //   final json = jsonDecode(string) as Map<String, dynamic>;
  //   final post = Post.fromJson(json);
  //   return post;
  // }
}
