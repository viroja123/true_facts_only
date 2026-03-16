import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Future<void> _openPrivacyPolicy() async {
    final Uri url = Uri.parse(
      "https://sites.google.com/view/truefactsonlyprivacypolicy/home",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _rateApp() async {
    final Uri url = Uri.parse(
      "https://play.google.com/store/apps/details?id=com.truefactsonly.app",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open Play Store");
    }
  }

  void _shareApp() {
    Share.share(
      "🧠 Learn something new every day!\n\n"
      "True Facts Only app brings amazing facts from around the world.\n\n"
      "Download now:\n"
      "https://play.google.com/store/apps/details?id=com.truefactsonly.app",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6C63FF), Color(0xFFFF6584)],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C63FF).withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/icon.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'True Facts Only',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'v1.1.0',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          _buildSettingsTile(
            context,
            icon: Icons.star_border,
            title: 'Rate Us',
            onTap: () {
              _rateApp();
            },
          ),
          _buildSettingsTile(
            context,
            icon: Icons.share_outlined,
            title: 'Share App',
            onTap: () {
              _shareApp();
            },
          ),
          _buildSettingsTile(
            context,
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {
              _openPrivacyPolicy();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
