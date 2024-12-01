// views/details_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/view_model/home_view_model.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final Color color;

  const DetailsPage({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    final segmentQuotes = viewModel.getQuotes(title);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: segmentQuotes.length,
          itemBuilder: (context, index) {
            return Card(
              color: color.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  segmentQuotes[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
