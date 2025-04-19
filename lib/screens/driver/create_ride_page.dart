import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taxi_receipt/screens/driver/tracking_screen.dart';

class CreateRidePage extends StatefulWidget {
  const CreateRidePage({super.key});

  @override
  State<CreateRidePage> createState() => _CreateRidePageState();
}

class _CreateRidePageState extends State<CreateRidePage> {
  final supabase = Supabase.instance.client;

  Future<void> createRide() async {
    final userId = supabase.auth.currentUser?.id;

    final result = await supabase
        .from('rides')
        .insert({
          'user_id': userId,
          'pickup_lat': 24.123,
          'pickup_lng': 54.321,
          'dropoff_lat': 24.567,
          'dropoff_lng': 54.765,
          'car_type': 'Economy',
          'payment_method': 'Cash',
          'status': 'pending',
        })
        .select()
        .single();

    final rideId = result['id'];
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (_) => TrackingScreen(rideId: rideId)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Ride')),
      body: Center(
        child: ElevatedButton(
          onPressed: createRide,
          child: const Text('Request Ride'),
        ),
      ),
    );
  }
}
