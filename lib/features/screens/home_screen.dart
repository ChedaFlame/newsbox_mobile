import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../app/app_utils/common/asset_images.dart';
import '../../app/app_utils/common/constant.dart';
import '../../app/app_utils/common/theme_colors.dart';
import '../../app/app_utils/common/ui.dart';
import '../../app/data/models/article.dart';
import '../../app/data/models/article_card.dart';
import '../../app/data/models/category_list.dart';
import 'bloc/articles_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  bool _tabControllerInitialized = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _isRefreshing = false;
  List<CategoryItem> categories = [];
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getArticles();
    _tabController = TabController(length: 1, vsync: this);
  }

  void _initTabController() {
    _tabController = TabController(length: categories.length + 1, vsync: this);
    _tabControllerInitialized = true;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }


  List filteredArticles(String? categoryId) {
    final items = categoryId == 'All'
        ? articles
        : articles.where((a) => a.category?.name == categoryId).toList();

    if (_searchQuery.isEmpty) return items;

    return items.where((a) {
      final headline = a.headline?.toLowerCase() ?? '';
      final categoryName = a.category?.name?.toLowerCase() ?? '';
      final q = _searchQuery.toLowerCase();;
      return headline.contains(q) || categoryName.contains(q);
    }).toList();
  }

  List<Article> filterArticles(List<Article> articles, String query) {
    if (query.isEmpty) return articles;
    final q = query.toLowerCase();
    return articles.where((article) {
      final headline = article.headline?.toLowerCase() ?? '';
      final categoryName = article.category?.name?.toLowerCase() ?? '';
      final content = article.content?.toLowerCase() ?? ''; // optional: search inside content

      return headline.contains(q) || categoryName.contains(q) || content.contains(q);
    }).toList();
  }


  Future<void> _refreshData() async {
    setState(() => _isRefreshing = true);
    BlocProvider.of<ArticlesBloc>(context).add(
      RefreshArticlesEvent(),
    );
  }

  getArticles() {
    BlocProvider.of<ArticlesBloc>(context).add(
      GetArticlesEvent(),
    );
  }


  @override
  Widget build(BuildContext context) {
    ConstantData().init(context);
    return BlocListener<ArticlesBloc, ArticlesState>(
      listener: (context, state) {
        if (state is ArticlesFailure) {
          Get.showSnackbar(Ui.ErrorSnackBar(message: state.error!));
        }
        else if (state is ArticlesLoaded) {
          setState(() {
            categories = state.categories;
            articles = state.articles;
            // initialize only after data loaded
            // if (!_tabControllerInitialized) {
              _tabController = TabController(length: categories.length + 1, vsync: this);
              _tabControllerInitialized = true;
            // }
          });
        } else if (state is RefreshArticlesSuccess) {
          Get.showSnackbar(Ui.SuccessSnackBar(message: state.msg!));
          getArticles();
        } else if (state is RefreshArticlesFailure) {
          Get.showSnackbar(Ui.ErrorSnackBar(message: state.error!));
        }
      },
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) => _getArticlesScreen(state)),
    );
  }

  Widget _getArticlesScreen(ArticlesState state) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Article> filtered = filterArticles(articles, _searchQuery);

    if (!_tabControllerInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset(
              LocalImages.logo,
              fit: BoxFit.fill,
            ),
            ),
            const SizedBox(width: 12),
            const Text('Daily NewsBox'),
          ],
        ),
        actions: [
          IconButton(onPressed: () {
            _refreshData();
          }, icon: const Icon(Icons.cast)),
        ],
      ),
        body: state is InitiatingGetArticlesState ? SizedBox(
          width: width,
          child: const SpinKitRing(
            color: ThemeColors.primaryColor,
            size: 50.0,
            lineWidth: 1.5,
          ),
        ) : Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search articles...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),

              Material(
                color: Theme.of(context).colorScheme.surface,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        width: 3, color: Theme.of(context).colorScheme.primary),
                    insets: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  tabs: [
                    const Tab(text: 'All'),
                    ...categories.map((c) => Tab(text: c.categoryName)).toList(),
                  ],
                ),
              ),

             Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RefreshIndicator(
                      onRefresh: _refreshData,
                      color: Theme.of(context).colorScheme.primary,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(12),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final article = filtered[index];
                          return ArticleCard(article: article);
                        },
                      ),
                    ),

                 ...categories.map((c) {
                    final items = filteredArticles(c.categoryName);
                    if (items.isEmpty) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            'No articles found in ${c.categoryName} category.',
                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: _refreshData,
                      color: Theme.of(context).colorScheme.primary,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(12),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final article = items[index];
                          return ArticleCard(article: article);
                        },
                      ),
                    );
                  }).toList(),]
                ),
              ),
            ],
        ),

    );

  }


}
