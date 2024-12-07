import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/Services/api_service.dart';
import 'package:news_app/componant/news_item_list.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(future: apiService.getBreakingNews(),
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