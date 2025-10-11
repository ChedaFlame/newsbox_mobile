# newsbox

# Flutter News Reader App

A modern Flutter application that fetches and displays news articles from a REST API. Built with Dio for networking and Bloc for scalable state management.

------------------------------------------------------------

Features

- Clean Architecture (Bloc Pattern)
- Dio for API calls
- Dynamic categories and articles
- Open articles in browser
- Error handling and loading states
- Clean and responsive UI

------------------------------------------------------------

Setup Instructions

 Prerequisites

- Flutter SDK (≥ 3.16)
- Android Studio or VSCode
- Emulator or real device

Install Dependencies

flutter pub get

flutter run

Dependencies

flutter:
sdk: flutter
dio: ^5.7.0
flutter_bloc: ^8.1.6
equatable: ^2.0.7
url_launcher: ^6.3.1
check the yaml file for more

API Endpoints

GET /api/articles - Get all articles (paginated)
GET /api/articles/:id - Get single article
GET /api/articles/search?q= - Search articles by keyword
GET /api/categories - Get available categories
GET /api/articles/category/:name - Get articles by category
POST /api/articles/refresh - Fetch fresh articles from news API

Launching Article URLs

Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
    }
}


class NewsBloc extends Bloc<NewsEvent, NewsState> {
final NewsRepository newsRepository;

Bloc Setup Example
NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<FetchNewsEvent>((event, emit) async {
            emit(NewsLoading());
            try {
                 final articles = await newsRepository.getArticles(event.categoryId);
                 emit(NewsLoaded(articles));
               } catch (e) {
                emit(NewsError(e.toString()));
            }
        });
    }
}

Commands Reference
flutter pub get
flutter clean
flutter run
flutter build apk