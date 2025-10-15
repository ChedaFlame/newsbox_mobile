part of 'articles_bloc.dart';

sealed class ArticlesState extends Equatable {
  const ArticlesState(this.attempt);
  final int attempt;
  @override
  List<Object> get props => [];
}


class ArticlesEmptyState extends ArticlesState {
  const ArticlesEmptyState() : super(0);
}

class InitiatingGetArticlesState extends ArticlesState {
  const InitiatingGetArticlesState(super.attempt);
}

class ArticlesLoaded extends ArticlesState {
  List<Article> articles;
  List<CategoryItem> categories;
  @override
  final int attempt;

  ArticlesLoaded(this.articles, this.categories, this.attempt) : super(attempt);

  @override
  List<Object> get props => [articles,categories];
}

class ArticlesFailure extends ArticlesState {
  final String? error;
  @override
  final int attempt;

  const ArticlesFailure(this.error, this.attempt) : super(attempt);

  @override
  List<Object> get props => [error!];

}

class RefreshArticlesFailure extends ArticlesState {
  final String? error;
  @override
  final int attempt;

  const RefreshArticlesFailure(this.error, this.attempt) : super(attempt);

  @override
  List<Object> get props => [error!];

}


class RefreshArticlesSuccess extends ArticlesState {
  final String? msg;
  @override
  final int attempt;

  const RefreshArticlesSuccess(this.msg, this.attempt) : super(attempt);

  @override
  List<Object> get props => [msg!];

}