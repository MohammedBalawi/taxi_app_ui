import 'package:flutter/material.dart';
import 'select_destination_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/m5.png'), fit: BoxFit.cover)),
        child: Stack(
          children: [
            // Container(
            //   color: isDark ? Colors.grey[900] : Colors.grey[300],
            //   child:  Center(
            //     child: Image(image: AssetImage('assets/m5.png'),fit: BoxFit.cover,)
            //   ),
            // ),

            Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SelectDestinationScreen()),
                    );
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Where to?",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 90,
              right: 10,
              left: 10,
              child: FloatingActionButton(
                heroTag: "current-location",
                onPressed: () {},
                backgroundColor: Colors.white,
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 180,
              right: 20,
              child: FloatingActionButton(
                heroTag: "current-location",
                onPressed: () {},
                backgroundColor: Colors.white,
                child: const Icon(Icons.my_location, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
