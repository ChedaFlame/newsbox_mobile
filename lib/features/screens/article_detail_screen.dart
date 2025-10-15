import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/app_utils/common/datetimehelper.dart';
import '../../app/app_utils/common/text_styles.dart';
import '../../app/data/models/article.dart';


class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.headline!)),
      body: ListView(
        children: [
          article.imageUrl != null ?
          Image.network(article.imageUrl ?? '', fit: BoxFit.cover):
          Image.asset(
            'assets/images/newsbox.png',
            width: double.infinity,
            height: 180.0,
            fit: BoxFit.cover,
          ),


          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.headline ?? "", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(DateTimeHelper().timeAgo(DateTime.parse(article.publishedAt!)), style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: article.description,
                        style: black12MediumTextStyle,
                      ),
                      TextSpan(
                        text: ' Read more',
                        style: blue14MediumTextStyle,
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchUrl(article.articleUrl ?? "");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  void _launchUrl(String? articleUrl) async {
    final Uri uri = Uri.parse(articleUrl!);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    }
  }

}