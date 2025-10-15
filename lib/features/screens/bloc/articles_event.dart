part of 'articles_bloc.dart';

sealed class ArticlesEvent extends Equatable {
  const ArticlesEvent();
  @override
  List<Object> get props => [];

}


class GetArticlesEvent extends ArticlesEvent {
  const GetArticlesEvent();
  @override
  List<Object> get props => [];

}

class RefreshArticlesEvent extends ArticlesEvent {
  const RefreshArticlesEvent();
  @override
  List<Object> get props => [];

}
