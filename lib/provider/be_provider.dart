import 'package:flutter/cupertino.dart';
import 'package:quoteapi/api_services/api_services.dart';
import 'package:quoteapi/model/BeRespnse.dart';

class BeProvider extends ChangeNotifier{
  final ApiServices _apiServices=ApiServices();
  List<BeRespnse>  _beList=[];
  bool _isLoading=false;
  String ? _error;

  ApiServices get apiServices => _apiServices;

  bool get isLoading => _isLoading;

  List<BeRespnse> get beList => _beList;

  String ? get error => _error;


  Future<void> fetchBeData() async{
    _isLoading=true;
    _error=null;
    notifyListeners();

    try{
      _beList=await _apiServices.fectchBeData();
    }catch(e)
    {
      _error=e.toString();
    }
    _isLoading=false;
    notifyListeners();
  }
}