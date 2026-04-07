import 'package:flutter/cupertino.dart';
import 'package:quoteapi/api_services/api_services.dart';
import 'package:quoteapi/model/commnet_%20response.dart';

class CommentProvider extends ChangeNotifier{

  final ApiServices _apiServices=ApiServices();

  List<CommentResponse> get list => _list;
  List<CommentResponse> _list=[];
  String  ?  _error;
  bool _isLoading=false;

  String ? get error => _error;

  bool get isLoading => _isLoading;

  Future<void> fetchComments() async{
    _isLoading=true;
    _error=null;
    notifyListeners();
    try{

      _list=await _apiServices.fetchComments();

    }catch(e){
      _error=e.toString();
    }
    _isLoading=false;
    notifyListeners();
  }
}