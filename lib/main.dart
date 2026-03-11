import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:true_facts_only/providers/bookmark_provider.dart';
import 'package:true_facts_only/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bookmarkProvider = BookmarkProvider();
  await bookmarkProvider.loadBookmarks();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider.value(value: bookmarkProvider)],
      child: const TrueFactOnlyApp(),
    ),
  );
}

class TrueFactOnlyApp extends StatelessWidget {
  const TrueFactOnlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'True Facts Only',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF6C63FF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6C63FF),
          secondary: Color(0xFFFF6584),
          surface: Color(0xFF1E1E1E),
        ),
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
