import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DashboardProvider extends ChangeNotifier{
  int _selectedIndex=0;
  int get selectedIndex=>_selectedIndex;

  void changeIndex(int index){
    _selectedIndex = index;
    notifyListeners();
  }

}