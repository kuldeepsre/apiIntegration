import 'package:http/http.dart' as http;
import 'package:quoteapi/model/BeRespnse.dart';
import 'package:quoteapi/model/albuum_response.dart';
import 'package:quoteapi/model/photos.dart';
import 'package:quoteapi/model/quotes_response.dart';
import 'dart:convert';

import '../model/user_response.dart';
class ApiServices {

  Future<List<QuotesResponse>> fetchQutes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['quotes'] as List)
          .map((e) => QuotesResponse.fromJson(e))
          .toList();
    }
    throw Exception("failed");
  }
  Future<List<PhotoResponse>> fechPhoto() async {
    final respose = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (respose.statusCode == 200) {
      List Data = jsonDecode(respose.body);
      return Data.map((e) => PhotoResponse.fromJson(e)).toList();
    }
    else {
      throw Exception("somthing wrong");
    }
  }
  Future<UserResponse> fetchUsers() async {
    final response =
    await http.get(Uri.parse("https://randomuser.me/api/?results=10"),);

    if (response.statusCode == 200) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load users");
    }
  }
  Future<List<AlbumResponse>> fetchAlbum() async{

    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"), headers: {
      'Accept' : 'application/json'
    });
    if(response.statusCode==200){
      List data=jsonDecode(response.body);
          return data.map((e)=>AlbumResponse.fromJson(e)).toList();

    }
    else{
      throw Exception("failde");
    }

  }
  Future<List<BeRespnse>> fectchBeData ()async{
    final Response=await http.get(Uri.parse("https://dummy-json.mock.beeceptor.com/continents"));
    if(Response.statusCode==200){
      List Data=jsonDecode(Response.body);

      return Data.map((e)=>BeRespnse.fromJson(e)).toList();
    }
    else{
      throw Exception("Faild to response");

    }
  }

}