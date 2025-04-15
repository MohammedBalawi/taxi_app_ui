import 'package:flutter/material.dart';
import 'settings_screen.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int rating = 0;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final driverName = "Ahmed Z.";
    final fare = "SAR 38";
    final distance = "12.4 km";
    final duration = "18 mins";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Summary"),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text("Thanks for riding with us!", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/Oval Copy 3.png"),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(driverName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("Fare: $fare"),
                    Text("Distance: $distance"),
                    Text("Duration: $duration"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Rate your driver", style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: rating > index ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Leave a comment...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Settings/Profile (or Home if you prefer)
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Submit", style: TextStyle(fontSize: 16,color: Colors.white)),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
