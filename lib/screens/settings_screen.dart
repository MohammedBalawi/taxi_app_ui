import 'package:flutter/material.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;
  bool isArabic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/Oval Copy 3.png"),
            ),
            const SizedBox(height: 10),
            const Text("Ahmed Z.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text("ahmedz@email.com", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),

            ListTile(
              leading: const Icon(Icons.brightness_6),
              title: const Text("Dark Mode"),
              trailing: Switch(
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    isDark = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Language"),
              trailing: DropdownButton<String>(
                value: isArabic ? 'ar' : 'en',
                items: const [
                  DropdownMenuItem(value: 'en', child: Text("English")),
                  DropdownMenuItem(value: 'ar', child: Text("العربية")),
                ],
                onChanged: (value) {
                  setState(() {
                    isArabic = value == 'ar';
                  });
                },
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                );
              },
              icon: const Icon(Icons.logout,color: Colors.white,),
              label: const Text("Logout",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
