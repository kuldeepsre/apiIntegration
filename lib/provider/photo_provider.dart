import 'package:flutter/cupertino.dart';
import 'package:quoteapi/api_services/api_services.dart';
import 'package:quoteapi/model/photos.dart';
class PhotoProvider extends ChangeNotifier{
  final ApiServices _apioServices=ApiServices();
  List<PhotoResponse>  _photoList=[];
  bool _isLoading=false;
  String ? _error;
  List<PhotoResponse> get photoList=>_photoList;
  bool get isLoding=>_isLoading;
  String ? get error=>_error;
  Future<void> fechPhoto() async{
    _isLoading=true;
    _error=null;
    notifyListeners();
    try{
      _photoList=await _apioServices.fechPhoto();

    }catch(e){
      _error=e.toString();
    }
    _isLoading=false;
    notifyListeners();
  }

}
