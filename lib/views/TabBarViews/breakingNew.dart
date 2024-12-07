import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/Services/api_service.dart';
import 'package:news_app/componant/news_item_list.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: FutureBuilder(future: apiService.getAllNews(),
        builder: (context,snapshot){
      if(snapshot.hasData){
        List<NewsModel>articlelist = snapshot.data ?? [];
        return ListView.builder(
            itemCount: articlelist.length,
            itemBuilder: (context,index){

          return NewsItemList(newsModel: articlelist[index],);
        });

      }
      return const Center(child: CircularProgressIndicator(color: Colors.black,));
    })
    );
  }
}
