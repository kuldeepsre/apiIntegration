import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../model/user_response.dart';

class UserProvider extends ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  List<Results> _users = [];
  bool _isLoading = false;
  String? _error;
  UserResponse? _response;
  List<Results> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;
  UserResponse? get response => _response;
  Info? get info => _response?.info;
  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.fetchUsers();
      _response = response; // 🔥 STORE FULL RESPONSE

      _users = response.results ?? [];

    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}