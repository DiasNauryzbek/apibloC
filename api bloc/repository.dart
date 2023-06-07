import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/src/features/auth/pages/home/logic/data/repository/model.dart';

class NewsRepository {
  String userUrl = 'https://dev.api.bordfoods.com/v1/mobile/news';
  Dio dio = Dio();
  Future<List<NewsModel>> getNews() async {
  Response response = await dio.get(userUrl,
      options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: {'city': '1'}));
  ({'Content-type': 'application/json', 'city': '1'});

  try{
    if (response.statusCode == 200) {
      // Use List<dynamic> for response data
      final List<dynamic> news = json.decode(json.encode(response.data));
      // Use List<NewsModel> for model class
      return news.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception(response);
    }
  }catch(e){
     print(e);
    throw Exception('Failed to load ');
  }
}


}

 
  
  
 /* Future<List<NewsModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));
    response.headers.clear();
    response.headers.addAll({
      'Content-type': 'Headers.jsonContentType',
      'responseType': 'ResponseType.json',
      'city': '1'
    });
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}*/

 
