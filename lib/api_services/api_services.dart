import 'package:http/http.dart' as http;
import 'package:quoteapi/model/quotes_response.dart';
import 'dart:convert';

class ApioServices{
  Future<List<QuotesResponse>> fetchQutes() async{
    final response=await http.get(Uri.parse('https://dummyjson.com/quotes'));
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      return (data['quotes'] as List).map((e)=>QuotesResponse.fromJson(e)).toList();
    }
    throw Exception("failed");
  }
}