import 'package:flutter/material.dart';
import 'package:true_facts_only/models/fact.dart';
import 'package:true_facts_only/screens/category_facts_screen.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore Topics',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoriesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          final category = categoriesList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryFactsScreen(category: category),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/$category.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(16),
                // gradient: LinearGradient(
                //   colors: [
                //     Theme.of(context).colorScheme.primary,
                //     Theme.of(context).colorScheme.secondary,
                //   ],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Theme.of(
                //       context,
                //     ).colorScheme.primary.withOpacity(0.3),
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //     offset: const Offset(0, 3),
                //   ),
                // ],
              ),
              child: Center(
                child: Text(
                  category.replaceAll('_', ' ').replaceAll('&', ' & '),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
