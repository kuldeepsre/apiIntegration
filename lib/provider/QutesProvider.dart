import 'package:flutter/material.dart';
import 'package:quoteapi/api_services/api_services.dart';
import 'package:quoteapi/model/quotes_response.dart';

class QutesProvider extends ChangeNotifier{
  final ApiServices _apioServices=ApiServices();
  String ? _error;
  bool _isLoading=false;
  List<QuotesResponse> _quotesList=[];
  List<QuotesResponse> get quotesList=>_quotesList;
  bool get isLoading =>_isLoading;
  String ? get error=>_error;
  Future<void> fetchQutes() async{
    _isLoading=true;
    _error=null;
    notifyListeners();
    try{
        _quotesList=await _apioServices.fetchQutes();
    }catch(e){
      _error=e.toString();
    }
    _isLoading=false;
    notifyListeners();
  }

}