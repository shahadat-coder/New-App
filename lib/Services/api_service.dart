import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/Models/news_model.dart';

class ApiService{

  final  allNewsUrl = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=50db3e09f4b64097be9555e090b64c4c";
  final breakingNewsUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=50db3e09f4b64097be9555e090b64c4c';



  Future<List<NewsModel>> getAllNews()async{
    try{
      Response response = await get(Uri.parse(allNewsUrl));
      if(response.statusCode ==200){
       Map<String,dynamic> json = jsonDecode(response.body);
       List<dynamic> body = json['articles'];
       List<NewsModel> articleList = body.map((item)=> NewsModel.fromJson(item)).toList();
       return articleList;
      }else{
        throw ('No news found');
      }

    }catch(e){
      throw e;
    }
  }


  Future<List<NewsModel>> getBreakingNews()async{
    try{
      Response response = await get(Uri.parse(breakingNewsUrl));
      if(response.statusCode ==200){
        Map<String,dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articleList = body.map((item)=> NewsModel.fromJson(item)).toList();
        return articleList;
      }else{
        throw ('No news found');
      }

    }catch(e){
      throw e;
    }
  }

}