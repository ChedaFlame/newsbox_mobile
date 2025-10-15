import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import '../../../app/app_utils/common/ui.dart';
import '../../../app/data/models/article.dart';
import '../../../app/data/models/category.dart';
import '../../../app/data/models/category_list.dart';
import '../repository/articles_repo.dart';

part 'articles_event.dart';

part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  late ArticlesRepository articlesRepository;

  ArticlesBloc(
    ArticlesEmptyState initialState, {
    required ArticlesRepository repository,
  }) : super(initialState) {
    articlesRepository = repository;
    on<ArticlesEvent>(_handleArticles);
  }

  FutureOr<void> _handleArticles(
    ArticlesEvent event,
    Emitter<ArticlesState> emit,
  ) async {
    final ArticlesState currentState = state;

    if (event is GetArticlesEvent) {
      Get.focusScope?.unfocus();
      try {
        emit(InitiatingGetArticlesState(currentState.attempt));
        final response = (await articlesRepository.getArticles());
        if (response.isNotEmpty == true) {
          final categories = await articlesRepository.getCategories();
          emit(ArticlesLoaded(response, categories, currentState.attempt));
        } else {
          emit(ArticlesFailure("Failed to get Articles", currentState.attempt));
        }
      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      }
    }

    if (event is RefreshArticlesEvent) {
      emit(InitiatingGetArticlesState(currentState.attempt));
      try {
        final response = (await articlesRepository.refreshArticles());
        if(response.success == true){
          emit(RefreshArticlesSuccess(response.message, currentState.attempt));
        }else{
          emit(RefreshArticlesFailure(response.message, currentState.attempt));
        }


      } catch (e) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
      }
    }
  }
}
