import 'package:flutter/foundation.dart';
import 'package:quoteapi/api_services/api_services.dart';
import 'package:quoteapi/model/albuum_response.dart';

class AlbumProvider extends ChangeNotifier{

  final ApiServices _apiServices=ApiServices();
  List<AlbumResponse> _albumList=[];
  bool _isLoading=false;
  String ? _error;

  List<AlbumResponse> get albumList=>_albumList;
  bool get isLoading=>_isLoading;
  String ? get error=>_error;

  Future<void> fetchAlbum() async {
    _isLoading=true;
    _error=null;
    notifyListeners();


    try{
      _albumList=await _apiServices.fetchAlbum();
    }catch(e){

      _error=e.toString();
    }
    _isLoading=false;
    notifyListeners();

  }



}