import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:true_facts_only/providers/bookmark_provider.dart';
import 'package:true_facts_only/widgets/fact_card.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saved Facts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Consumer<BookmarkProvider>(
        builder: (context, provider, child) {
          final facts = provider.bookmarkedFacts;
          if (facts.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bookmark_border, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No saved facts yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: facts.length,
            itemBuilder: (context, index) {
              return FactCard(fact: facts[index]);
            },
          );
        },
      ),
    );
  }
}
