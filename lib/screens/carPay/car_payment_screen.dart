import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../driver/tracking_screen.dart';

class CarPaymentScreen extends StatefulWidget {
  final String rideId;

  const CarPaymentScreen({super.key, required this.rideId});

  @override
  State<CarPaymentScreen> createState() => _CarPaymentScreenState();
}

class _CarPaymentScreenState extends State<CarPaymentScreen> {
  final supabase = Supabase.instance.client;

  int selectedCar = 0;
  String selectedPayment = 'Card';

  final carTypes = [
    {'type': 'Economy', 'price': 'SAR 25'},
    {'type': 'Business', "price": 'SAR 38'},
    {'type': 'XL', 'price': 'SAR 52'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Car & Payment'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Choose your ride', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carTypes.length,
                itemBuilder: (context, index) {
                  final car = carTypes[index];
                  final isSelected = selectedCar == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedCar = index);
                    },
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.amber[200] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          if (isSelected)
                            const BoxShadow(
                              blurRadius: 6,
                              color: Colors.black26,
                              offset: Offset(0, 3),
                            ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Image(
                                image: AssetImage(
                                    'assets/ChatGPT Image Apr 19, 2025, 05_55_37 AM.png'),
                                width: 60),
                          ),
                          const SizedBox(height: 10),
                          Text(car['type']!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(car['price']!),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text('Select Payment Method', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildPaymentOption('Card', Icons.credit_card),
                const SizedBox(width: 20),
                _buildPaymentOption('Cash', Icons.attach_money),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    await supabase.from('rides').update({
                      'car_type': carTypes[selectedCar]['type'],
                      'payment_method': selectedPayment,
                      'status': 'accepted',
                    }).eq('id', '0e2f4ab7-9a45-4af8-828f-66f0da098667');

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const TrackingScreen(
                            rideId: '0e2f4ab7-9a45-4af8-828f-66f0da098667'),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${e.toString()}")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Request Ride',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String method, IconData icon) {
    final selected = selectedPayment == method;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedPayment = method);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: selected ? Colors.amber[100] : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, size: 28),
              const SizedBox(height: 6),
              Text(method),
            ],
          ),
        ),
      ),
    );
  }
}
