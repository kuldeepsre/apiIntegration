import 'package:flutter/material.dart';

import '../api_services/api_services.dart';
import '../model/ReceiptResponse.dart';
import '../model/user_response.dart';

class RecipeProvider extends ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  List<Recipes> _recipes = [];
  bool _isLoading = false;
  String? _error;

  List<Recipes> get recipes => _recipes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _apiService.fetchReciept();
      _recipes = response.recipes ?? [];
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}