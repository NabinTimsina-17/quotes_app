import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/view_model/home_view_model.dart';

/// Details Page displays quotes in cards for a selected category.
class DetailsPage extends StatelessWidget {
  final String category;

  const DetailsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Access the ViewModel instance
    final viewModel = Provider.of<HomeViewModel>(context);

    // Get quotes for the selected category
    final quotes = viewModel.getQuotes(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: quotes.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: quotes.length,
              itemBuilder: (context, index) {
                return QuoteCard(
                  quote: quotes[index],
                  backgroundImage: _getCategoryImage(category),
                );
              },
            ),
    );
  }

  /// Display when no quotes are available.
  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_dissatisfied, size: 60, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            "No quotes available for this category!",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  /// Function to return an image path based on the category.
  String _getCategoryImage(String category) {
    switch (category.toLowerCase()) {
      case 'Inspirational':
        return 'assets/images/background_1.jpeg';
      case 'life':
        return 'assets/images/background_2.jpeg';
      case 'love':
        return 'assets/images/background_3.jpeg';
      case 'success':
        return 'assets/images/background_4.jpeg';
      case 'happiness':
        return 'assets/images/background_5.jpeg';
      default:
        return 'assets/images/background_6.jpeg';
    }
  }
}

/// A reusable card to display a quote with an image background.
class QuoteCard extends StatelessWidget {
  final String quote;
  final String backgroundImage;

  const QuoteCard({super.key, required this.quote, required this.backgroundImage});

  /// Copies the quote text to clipboard.
  Future<void> _copyToClipboard(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: quote));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Quote copied to clipboard!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              backgroundImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Quote Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                quote,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          // Copy Button
          Positioned(
            bottom: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.copy, color: Colors.white),
              onPressed: () => _copyToClipboard(context),
            ),
          ),
        ],
      ),
    );
  }
}
