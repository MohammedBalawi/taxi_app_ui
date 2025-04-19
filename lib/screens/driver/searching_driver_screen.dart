import 'dart:async';
import 'package:flutter/material.dart';
import '../carPay/car_payment_screen.dart';

class SearchingDriverScreen extends StatefulWidget {
  final String rideId;

  const SearchingDriverScreen({super.key, required this.rideId});

  @override
  State<SearchingDriverScreen> createState() => _SearchingDriverScreenState();
}

class _SearchingDriverScreenState extends State<SearchingDriverScreen> {
  bool showDrivers = false;

  final mockedDrivers = [
    {
      'id': 'driver_1',
      'name': 'أحمد حمادة',
      'car': 'Toyota Camry - White',
      'plate': 'ABC-1234',
      'eta': '3 m',
      'driverImg': 'assets/Oval Copy 3.png',
      'carImg': 'assets/ChatGPT Image Apr 19, 2025, 05_55_37 AM.png',
    },
    {
      'id': 'driver_2',
      'name': 'محمد السالم',
      'car': 'Hyundai Sonata - Black',
      'plate': 'XYZ-5678',
      'eta': '5 m',
      'driverImg': 'assets/Oval Copy 2.png',
      'carImg': 'assets/ChatGPT Image Apr 19, 2025, 05_55_37 AM.png',
    },
    {
      'id': 'driver_3',
      'name': 'عائد الشريف',
      'car': 'Kia Sportage - Grey',
      'plate': 'DEF-7890',
      'eta': '7 m',
      'driverImg': 'assets/Groمup 7.png',
      'carImg': 'assets/ChatGPT Image Apr 19, 2025, 05_55_37 AM.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showDrivers = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!showDrivers) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 30),
              Text(
                'Searching Driver ...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Driver'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemCount: mockedDrivers.length,
        itemBuilder: (context, index) {
          final driver = mockedDrivers[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      driver['driverImg']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(driver['name']!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(driver['car']!),
                        Text("لوحة: ${driver['plate']}"),
                        Text("الوقت المتوقع: ${driver['eta']}"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          driver['carImg']!,
                          width: 70,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CarPaymentScreen(
                                rideId: '0e2f4ab7-9a45-4af8-828f-66f0da098667',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("اختيار",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
