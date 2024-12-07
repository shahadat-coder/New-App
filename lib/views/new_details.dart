import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewDetails extends StatefulWidget {
  final NewsModel newsModel;
  const NewDetails({super.key, required this.newsModel});

  @override
  State<NewDetails> createState() => _NewDetailsState();
}

class _NewDetailsState extends State<NewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text(widget.newsModel.title.toString(),style: TextStyle(
       fontSize: 20,
       fontWeight: FontWeight.w600
     ),),),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 250,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(widget.newsModel.source!.name.toString())
                ),
                const SizedBox(width: 10),
                Text(widget.newsModel.publishedAt.toString()),
              ],
            ),
            const SizedBox(height: 8,),
            Text(widget.newsModel.author.toString()),
            const SizedBox(height: 8,),
            Text(widget.newsModel.title.toString()),
            const SizedBox(height: 10,),
            Text(widget.newsModel.description.toString()),
            const SizedBox(height: 20,),

            ElevatedButton(onPressed: ()async{

              final Uri uri = Uri.parse(widget.newsModel.url.toString());
              if(!await launchUrl(uri)){
                throw Exception('Could not launch');
              }

            },
                child: Text('Read More')),
          ],
        ),
      ),
    );
  }
}
