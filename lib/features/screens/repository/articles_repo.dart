

import '../../../app/data/models/article.dart';
import '../../../app/data/models/category_list.dart';
import '../../../app/data/models/refresh.dart';

abstract class ArticlesRepository {

  Future<List<Article>> getArticles();

  Future<List<CategoryItem>> getCategories();

  Future<Refresh> refreshArticles();

  Future<Article> getArticlesById(int articleId);

  Future<List<Article>> getArticlesBySearch(String query);

  Future<List<Article>> getArticlesByCategory(String? category);

}

