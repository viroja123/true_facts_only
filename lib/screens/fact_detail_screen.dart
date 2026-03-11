import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:true_facts_only/models/fact.dart';
import 'package:true_facts_only/providers/bookmark_provider.dart';
import 'package:true_facts_only/widgets/fact_card.dart';

class FactDetailScreen extends StatelessWidget {
  final Fact fact;

  const FactDetailScreen({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    final relatedFacts = allFacts
        .where((f) => f.category == fact.category && f.id != fact.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fact Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero section for the specific fact
            Hero(
              tag: 'fact_${fact.id}',
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/${fact.category}.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.darken,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          fact.category.replaceAll('_', ' '),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "\"${fact.content}\"",
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.4,
                            ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Share.share(
                                "${fact.content} - Expand your mind with True Facts Only!",
                              );
                            },
                          ),
                          Consumer<BookmarkProvider>(
                            builder: (context, provider, child) {
                              final isBookmarked = provider.isBookmarked(
                                fact.id,
                              );
                              return IconButton(
                                icon: Icon(
                                  isBookmarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  provider.toggleBookmark(fact);
                                  ScaffoldMessenger.of(
                                    context,
                                  ).clearSnackBars();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        isBookmarked
                                            ? 'Removed from Bookmarks'
                                            : 'Saved to Bookmarks',
                                      ),
                                      duration: const Duration(seconds: 1),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Related facts section
            if (relatedFacts.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: Text(
                  'More from ${fact.category.replaceAll('_', ' ')}',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),

            if (relatedFacts.isEmpty)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'No more facts in this category yet. Stay tuned!',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ),

            ListView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: relatedFacts.length,
              itemBuilder: (context, index) {
                return FactCard(fact: relatedFacts[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
