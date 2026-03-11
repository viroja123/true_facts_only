import 'package:flutter/material.dart';
import 'package:true_facts_only/models/fact.dart';
import 'package:true_facts_only/widgets/fact_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily Facts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: allFacts.length,
        itemBuilder: (context, index) {
          final fact = allFacts[index];
          return FactCard(fact: fact);
        },
      ),
    );
  }
}
