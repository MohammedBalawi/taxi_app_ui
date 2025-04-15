import 'package:flutter/material.dart';
import 'car_payment_screen.dart';

class SelectDestinationScreen extends StatefulWidget {
  const SelectDestinationScreen({Key? key}) : super(key: key);

  @override
  State<SelectDestinationScreen> createState() => _SelectDestinationScreenState();
}

class _SelectDestinationScreenState extends State<SelectDestinationScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<String> suggestions = [
    "Home",
    "Work",
    "King Abdulaziz Airport",
    "Mall of Arabia",
    "University",
  ];

  String selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Destination"),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) => setState(() => selected = value),
              decoration: InputDecoration(
                hintText: "Enter destination...",
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final item = suggestions[index];
                  return ListTile(
                    leading: const Icon(Icons.location_pin),
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        _controller.text = item;
                        selected = item;
                      });
                    },
                  );
                },
              ),
            ),
            if (selected.isNotEmpty)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CarPaymentScreen()),
                    );
                  },
                  child: const Text("Next", style: TextStyle(fontSize: 16,color: Colors.white)),
                ),
              ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
