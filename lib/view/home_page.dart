// home_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';
import '../view_model/theme_provider.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose(); // Dispose controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Access HomeViewModel and ThemeProvider
    final viewModel = Provider.of<HomeViewModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Filtered list based on search query
    final filteredItems = viewModel.gridItems
        .where((item) =>
            item.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes For Every Mood"),
        centerTitle: true,
        actions: [
          // Theme Toggle Switch
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
            activeColor: Colors.white,
            inactiveThumbColor: Colors.grey,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search categories...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value; // Update search query
                });
              },
            ),
            const SizedBox(height: 10),
            // GridView with filtered items
            Expanded(
              child: viewModel.gridItems.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns
                        crossAxisSpacing: 10.0, // Space between columns
                        mainAxisSpacing: 10.0, // Space between rows
                        childAspectRatio: 1.5, // Aspect ratio of each item
                      ),
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        final item = filteredItems[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to the details page with the category title
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                   const QuoteCard(backgroundImage: '', quote: '',),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: item.color,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(item.icon,
                                    size: 40, color: Colors.white),
                                const SizedBox(height: 10),
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
