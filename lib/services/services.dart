import 'dart:convert';

import 'package:mvvm_example_with_provider/model/picsum_model.dart';

import 'package:http/http.dart' as http;

class PicsumService{

  Future<List<PicsumModel>> fetcPicturesApi() async{
    String url = "https://picsum.photos/v2/list";
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List<dynamic>;
      final picsumList = json.map((e) => PicsumModel.fromJson(e)).toList();
      return picsumList;
    }else{
      throw Exception("Error fetching pictures");
    }

  }

}