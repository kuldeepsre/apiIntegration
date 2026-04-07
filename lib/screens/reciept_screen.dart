import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/reciept_provider.dart';

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<RecipeProvider>(context, listen: false).fetchRecipes());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeProvider>(context);

    if (provider.isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (provider.error != null) {
      return Scaffold(
        body: Center(child: Text(provider.error!)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Recipes")),
      body: ListView.builder(
        itemCount: provider.recipes.length,
        itemBuilder: (context, index) {
          final recipe = provider.recipes[index];

          return Card(
            child: ListTile(
              leading: Image.network(recipe.image ?? ""),
              title: Text(recipe.name ?? ""),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rating: ${recipe.rating}"),
                  Text("ingredients: ${ recipe.ingredients != null && recipe.ingredients!.isNotEmpty
                      ? recipe.ingredients!.take(2).join(", ")
                      : "No ingredients"}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}