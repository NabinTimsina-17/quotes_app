import 'package:flutter/material.dart';
import 'package:quotes_app/model/grid_item.dart';

class HomeViewModel extends ChangeNotifier {
  // Define the grid items
  final List<GridItem> gridItems = [
    GridItem(title: "Alone", icon: Icons.sentiment_dissatisfied, color: Colors.blue),
    GridItem(title: "Angry", icon: Icons.sentiment_very_dissatisfied, color: Colors.red),
    GridItem(title: "Anniversary", icon: Icons.cake, color: Colors.orange),
    GridItem(title: "Attitude", icon: Icons.military_tech, color: Colors.brown),
    GridItem(title: "Awesome", icon: Icons.thumb_up, color: Colors.purple),
    GridItem(title: "Awkward Moment", icon: Icons.sentiment_neutral, color: Colors.pink),
    GridItem(title: "Beard", icon: Icons.face, color: Colors.teal),
    GridItem(title: "Beautiful", icon: Icons.favorite, color: Colors.pinkAccent),
    GridItem(title: "Best", icon: Icons.star, color: Colors.green),
    GridItem(title: "Bike", icon: Icons.pedal_bike, color: Colors.deepPurple),
  ];

  // Define quotes for each category
  final Map<String, List<String>> quotes = {
    "Alone": ["You are never alone.",
     "Being alone is a strength.", 
     "Solitude is peace."],
    "Angry": ["Control your anger.", "Anger hurts you most.", "Let go of anger to be free."],
    "Anniversary": ["Happy Anniversary!", "Cheers to many more years.", "Love grows with time."],
    "Attitude": ["Attitude is everything.", "Stay confident.", "Your vibe attracts your tribe."],
  };

  // Get quotes for a specific category
  List<String> getQuotes(String category) {
    return quotes[category] ?? ["No quotes available for this category."];
  }
}
