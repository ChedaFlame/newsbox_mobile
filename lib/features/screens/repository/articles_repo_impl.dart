import 'dart:convert';

import 'package:get/get.dart';
import '../../../app/data/models/article.dart';
import '../../../app/data/models/category.dart';
import '../../../app/data/models/category_list.dart';
import '../../../app/data/models/refresh.dart';
import '../../../app/data/providers/app_server_provider.dart';
import 'articles_repo.dart';


class ArticlesRepositoryImpl implements ArticlesRepository {
  final AppApiClient _remoteApiClient;

  ArticlesRepositoryImpl() : _remoteApiClient = Get.find<AppApiClient>();

  @override
  Future<List<Article>> getArticles() {
   final Future<List<Article>> response = _remoteApiClient.getArticles();
    return response;
  }

  @override
  Future<List<CategoryItem>> getCategories() {
    final Future<List<CategoryItem>> response = _remoteApiClient.getCategories();
    return response;
  }

  @override
  Future<List<Article>> getArticlesByCategory(String? category) {
    final Future<List<Article>> response = _remoteApiClient.getArticlesByCategory(category);
    return response;
  }

  @override
  Future<Article> getArticlesById(int articleId) {
    final Future<Article> response = _remoteApiClient.getArticlesById(articleId);
    return response;
  }

  @override
  Future<List<Article>> getArticlesBySearch(String? query) {
    final Future<List<Article>> response = _remoteApiClient.getArticlesBySearch(query);
    return response;
  }

  @override
  Future<Refresh> refreshArticles() {
    final Future<Refresh> response = _remoteApiClient.refreshArticles();
    return response;
  }



}
