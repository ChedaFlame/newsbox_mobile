import 'package:flutter/material.dart';
import '../../app_utils/common/datetimehelper.dart';
import 'article.dart';
import '../../../features/screens/article_detail_screen.dart';


class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(article: article),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: article.imageUrl != null ?
              Image.network(article.imageUrl ?? 'assets/images/newsbox.png', height: 180, width: double.infinity, fit: BoxFit.cover):
              Image.asset(
                'assets/images/newsbox.png',
                width: double.infinity,
                height: 180.0,
                fit: BoxFit.cover,
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.headline ?? "", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(article.description ?? "", maxLines: 10, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateTimeHelper().timeAgo(DateTime.parse(article.publishedAt!)), style: const TextStyle(color: Colors.grey)),
                      Row(children: [IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)), IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))])
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}