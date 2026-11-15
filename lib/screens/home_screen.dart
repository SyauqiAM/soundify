import 'package:flutter/material.dart';

import '../data/music_data.dart';
import '../models/music_category.dart';
import '../widgets/category_card.dart';
import '../widgets/search_bar.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<MusicCategory> filteredCategories = musicCategories.where((
      category,
    ) {
      return category.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF101A1B),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SOUNDIFY',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Color(0xFF35D6B0),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Discover your music mood',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const CircleAvatar(
                    backgroundColor: Color(0xFF233536),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              MusicSearchBar(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              const SizedBox(height: 25),

              const Text(
                'Explore Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                'Find the perfect music for your mood',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),

              const SizedBox(height: 18),

              Expanded(
                child: filteredCategories.isEmpty
                    ? const Center(
                        child: Text(
                          'Genre not found',
                          style: TextStyle(color: Colors.white70),
                        ),
                      )
                    : GridView.builder(
                        itemCount: filteredCategories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                              childAspectRatio: 1.15,
                            ),
                        itemBuilder: (context, index) {
                          final category = filteredCategories[index];

                          return CategoryCard(
                            category: category,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${category.name} selected'),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: MusicBottomNavigation(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
