import 'package:flutter/material.dart';
import 'rating_screen.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final driverName = "Ahmed Z.";
    final carModel = "Toyota Camry - White";
    final plateNumber = "ABC-1234";
    final eta = "3 mins";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/m5.png'),fit: BoxFit.cover,
          )
        ),
        child: Stack(
          children: [
            // Placeholder لخريطة


            // بطاقة تتبع السائق
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Your driver is on the way!", style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/Oval Copy 3.png'), // ضع صورة سائق وهمية أو شبكة لاحقاً
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(driverName, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(carModel),
                              Text("Plate: $plateNumber"),
                            ],
                          ),
                        ),
                        Text(eta, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.call,color: Colors.black,),
                            label: const Text("Call",style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.message,color: Colors.black,),
                            label: const Text("Message",style: TextStyle(color: Colors.black),),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const RatingScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("End Trip",style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
