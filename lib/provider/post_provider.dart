
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../api_services/api_services.dart';
import '../model/postResponse.dart';

class PostProvider extends ChangeNotifier{
  final ApiServices _apiServices=ApiServices();
  List<Posts>  _list=[];
  String ? _error ;

  List<Posts> get list => _list;
  bool _isLoading=false;

  String ? get error => _error;

  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async{
    _isLoading=true;
    _error=null;
    notifyListeners();
    try{
      final response=await _apiServices.fetchPost();
      _list=response.posts??[];
    }
    catch(e){
      _error=e.toString();
    }
    _isLoading=false;
    notifyListeners();
  }
}