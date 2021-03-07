import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data);
    return data;
  }
}

Future<List<dynamic>> search(String query) async {
  final String url = 'https://www.episodate.com/api/search?q=$query&page=1';

  final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );

  final Response response = await client.get(url);

  final Map<String, dynamic> decodedJson = jsonDecode(response.body);

  final List<dynamic> tvShows = decodedJson['tv_shows'];

  return tvShows;
}
