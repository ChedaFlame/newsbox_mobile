
import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;
import 'package:get/get.dart';
import '../../env/env_config.dart';
import '../models/article.dart';
import '../models/category_list.dart';
import '../models/refresh.dart';
import '../services/api_endpoints.dart';
import 'api_provider.dart';
import 'dio_client.dart';
import 'package:http/http.dart' as http;

class AppApiClient extends GetxService with ApiClient {
  DioClient? _httpClient;
  dio.Options? _optionsNetwork;
  dio.Options? _optionsCache;
  EnvConfig environment;

  AppApiClient(this.environment) {
    baseUrl = environment.baseUrl;
    _httpClient = DioClient(baseUrl!, dio.Dio());
  }


  Future<AppApiClient> init() async {
    _optionsNetwork = _httpClient?.optionsNetwork;
    _optionsCache = _httpClient?.optionsCache;
    return this;
  }

  bool isLoading({required String task, required List<String> tasks}) {
    return _httpClient!.isLoading(task: task, tasks: tasks);
  }

  void setLocale(String locale) {
    _optionsNetwork?.headers?['Accept-Language'] = locale;
    _optionsCache?.headers?['Accept-Language'] = locale;
  }

  void forceRefresh() {
    if (!foundation.kIsWeb && !foundation.kDebugMode) {
      _optionsCache = dio.Options(headers: _optionsCache?.headers);
      _optionsNetwork = dio.Options(headers: _optionsNetwork?.headers);
    }
  }


  Future<List<Article>> getArticles() async {

    try {
      Uri uri = getApiBaseUri(Apis.getArticles);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'].map<Article>((obj) => Article.fromJson(obj)).toList();
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }

      // var response = await _httpClient?.getUri(uri,options: _optionsNetwork);
      // if (response.statusCode == 200) {
      //   return response.data['data'].map<Article>((obj) => Article.fromJson(obj)).toList();
      // } else {
      //   throw Exception(response.statusMessage);
      // }
    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.sendTimeout ||
          e.type == dio.DioExceptionType.receiveTimeout) {
        throw Exception('Connection timed out. Please try again.');
      } else if (e.type == dio.DioExceptionType.badResponse) {
        throw Exception(
            'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      } else if (e.type == dio.DioExceptionType.unknown) {
        throw Exception('Cannot connect to server. Check your internet.');
      } else {
        throw Exception('Unexpected error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error2: ${e.toString()}');
    }

  }

  Future<List<CategoryItem>> getCategories() async {
    Uri uri = getApiBaseUri(Apis.getCategories);
    try {

      final responseCat = await http.get(uri);
      if (responseCat.statusCode == 200) {
         final data = jsonDecode(responseCat.body);
         return data['data'].map<CategoryItem>((obj) => CategoryItem.fromJson(obj)).toList();
      } else {
        throw Exception('Failed to load articles: ${responseCat.statusCode}');
      }


      // var response = await _httpClient?.getUri(uri, options: _optionsNetwork);
      // if (response.statusCode == 200) {
      //   return response.data['data'].map<CategoryItem>((obj) => CategoryItem.fromJson(obj)).toList();
      // } else {
      //   throw Exception(response['message'][0]);
      // }

    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.sendTimeout ||
          e.type == dio.DioExceptionType.receiveTimeout) {
        throw Exception('Connection timed out. Please try again.');
      } else if (e.type == dio.DioExceptionType.badResponse) {
        throw Exception(
            'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      } else if (e.type == dio.DioExceptionType.unknown) {
        throw Exception('Cannot connect to server. Check your internet.');
      } else {
        throw Exception('Unexpected error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

  }

  Future<Article> getArticlesById(int? articleId) async {


    try {
      Uri uri = getApiBaseUri("${Apis.getArticles}/$articleId");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Article.fromJson(data['data']);
        //return data['data'].map<Article>((obj) => Article.fromJson(obj)).toList();
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }


      // Uri uri = getApiBaseUri("${Apis.getArticles}/$articleId");
      // var response = await _httpClient?.getUri(uri, options: _optionsNetwork);
      // if (response['message'] == "Success") {
      //   return Article.fromJson(response['data']);
      // } else {
      //   throw Exception(response['message'][0]);
      // }

    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.sendTimeout ||
          e.type == dio.DioExceptionType.receiveTimeout) {
        throw Exception('Connection timed out. Please try again.');
      } else if (e.type == dio.DioExceptionType.badResponse) {
        throw Exception(
            'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      } else if (e.type == dio.DioExceptionType.unknown) {
        throw Exception('Cannot connect to server. Check your internet.');
      } else {
        throw Exception('Unexpected error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }


  Future<List<Article>> getArticlesByCategory(String? category) async {
    Uri uri = getApiBaseUri(Apis.getArticleByCategory);

    try {

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'].map<Article>((obj) => Article.fromJson(obj)).toList();
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }

      // var response = await _httpClient?.getUri(uri, options: _optionsNetwork);
      // if (response['statusCode'] == 200) {
      //   return response.data['data'].map<Article>((obj) => Article.fromJson(obj)).toList();
      // } else {
      //   throw Exception(response.data['message'][0]);
      // }

    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.sendTimeout ||
          e.type == dio.DioExceptionType.receiveTimeout) {
        throw Exception('Connection timed out. Please try again.');
      } else if (e.type == dio.DioExceptionType.badResponse) {
        throw Exception(
            'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      } else if (e.type == dio.DioExceptionType.unknown) {
        throw Exception('Cannot connect to server. Check your internet.');
      } else {
        throw Exception('Unexpected error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

  }

  Future<List<Article>> getArticlesBySearch(String? query) async {
    Uri uri = getApiBaseUri("${Apis.getArticles}/search?q=$query");


    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['data'].map<Article>((obj) => Article.fromJson(obj)).toList();
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }

      // var response = await _httpClient?.getUri(uri, options: _optionsNetwork);
      // if (response.statusCode == 200) {
      //   return response.data['data'].map<Article>((obj) => Article.fromJson(obj)).toList();
      // } else {
      //   throw Exception(response.data['message']);
      // }
    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.sendTimeout ||
          e.type == dio.DioExceptionType.receiveTimeout) {
        throw Exception('Connection timed out. Please try again.');
      } else if (e.type == dio.DioExceptionType.badResponse) {
        throw Exception(
            'Server error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      } else if (e.type == dio.DioExceptionType.unknown) {
        throw Exception('Cannot connect to server. Check your internet.');
      } else {
        throw Exception('Unexpected error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }

  }

  Future<Refresh> refreshArticles() async {
    Uri uri = getApiBaseUri(Apis.getRefreshArticles);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Refresh.fromJson(data['data']);

      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }

      // var response = await _httpClient?.postUri(uri, data: {}, options: _optionsNetwork);
      // if (response.statusCode == 200) {
      //   return Refresh.fromJson(response.data);
      // } else {
      //   throw Exception(response.data['message']);
      // }

    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.sendTimeout ||
          e.type == dio.DioExceptionType.receiveTimeout) {
        throw Exception('Connection timed out. Please try again.');
      } else if (e.type == dio.DioExceptionType.badResponse) {
        throw Exception('Server error: ${e.response?.statusCode} ${e.response?.statusMessage}');
      } else if (e.type == dio.DioExceptionType.unknown) {
        throw Exception('Cannot connect to server. Check your internet.');
      } else {
        throw Exception('Unexpected error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }


  }

}



