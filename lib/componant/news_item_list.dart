import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/views/new_details.dart';

class NewsItemList extends StatelessWidget {

  final NewsModel newsModel;
  const NewsItemList({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewDetails(newsModel: newsModel),
          ),
        );
      },

      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: newsModel.urlToImage.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 8,),
            Row(
              children: [
                Container(
                  child: Text(newsModel.source!.name.toString()),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.tealAccent,
                    borderRadius: BorderRadius.circular(15),
                )
                ),
                const SizedBox(width: 10),
                Text(newsModel.publishedAt.toString()),
              ],
            ),
            const SizedBox(height: 8,),
            Text(newsModel.author.toString()),
            const SizedBox(height: 8,),
            Text(newsModel.title.toString()),
          ],
        ),
      ),
    );
  }
}
