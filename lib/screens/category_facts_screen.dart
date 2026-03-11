import 'package:flutter/material.dart';
import 'package:true_facts_only/models/fact.dart';
import 'package:true_facts_only/widgets/fact_card.dart';

class CategoryFactsScreen extends StatelessWidget {
  final String category;

  const CategoryFactsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final facts = allFacts.where((fact) => fact.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.replaceAll('_', ' '),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: facts.isEmpty
          ? const Center(
              child: Text(
                'More facts coming soon!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: facts.length,
              itemBuilder: (context, index) {
                return FactCard(fact: facts[index]);
              },
            ),
    );
  }
}
