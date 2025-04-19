import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  final supabase = Supabase.instance.client;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<List<Map<String, dynamic>>> fetchAvailableRides() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'id': '1',
        'pickup_location': 'مطار الملك عبدالعزيز',
        'drop_location': 'الجامعة',
        'status': 'pending',
      },
      {
        'id': '2',
        'pickup_location': 'رد سي مول',
        'drop_location': 'البلد',
        'status': 'pending',
      },
      {
        'id': '3',
        'pickup_location': 'دوار التاريخ',
        'drop_location': 'شارع الأمير سلطان',
        'status': 'pending',
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchMyRides() async {
    final driverId = supabase.auth.currentUser?.id;
    if (driverId == null) return [];

    final response = await supabase
        .from('rides')
        .select()
        .eq('driver_id', driverId)
        .inFilter('status', ['accepted', 'on_trip']).order('created_at',
            ascending: false);

    return response;
  }

  Future<void> acceptRide(String rideId) async {
    final driverId = supabase.auth.currentUser?.id;
    if (driverId == null) return;

    await supabase.from('rides').update({
      'driver_id': driverId,
      'status': 'accepted',
    }).eq('id', rideId);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Accept')),
    );
    setState(() {});
  }

  Future<void> _updateRideStatus(String rideId, String newStatus) async {
    await supabase.from('rides').update({'status': newStatus}).eq('id', rideId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Update to  "$newStatus"')),
    );
    setState(() {});
  }

  Widget buildRideCard(Map<String, dynamic> ride, {bool showAccept = false}) {
    final status = ride['status'];
    final rideId = ride['id'];

    return Card(
      elevation: 6,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          'at : ${ride['pickup_location']}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('for: ${ride['drop_location']}'),
        trailing: showAccept
            ? ElevatedButton(
                onPressed: () => acceptRide(rideId),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Accepted'),
              )
            : _buildActionButton(status, rideId),
      ),
    );
  }

  Widget _buildActionButton(String status, String rideId) {
    if (status == 'accepted') {
      return ElevatedButton(
        onPressed: () => _updateRideStatus(rideId, 'on_trip'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        child: const Text("Start"),
      );
    } else if (status == 'on_trip') {
      return ElevatedButton(
        onPressed: () => _updateRideStatus(rideId, 'completed'),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        child: const Text("End"),
      );
    } else {
      return const Text("Ok");
    }
  }

  Widget buildAvailableRidesTab() {
    final mockedRides = [
      {
        'id': '1',
        'pickup_location': 'الازهر',
        'drop_location': 'الجامعة',
        'status': 'pending',
      },
      {
        'id': '2',
        'pickup_location': 'كبتال موب',
        'drop_location': 'غزة',
        'status': 'pending',
      },
      {
        'id': '3',
        'pickup_location': 'دوار زعرب',
        'drop_location': 'شارع لفة بدر',
        'status': 'pending',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: mockedRides.length,
      itemBuilder: (context, index) =>
          buildRideCard(mockedRides[index], showAccept: true),
    );
  }

  Widget buildMyRidesTab() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchMyRides(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final rides = snapshot.data ?? [];
        if (rides.isEmpty) {
          return const Center(child: Text("Didnt have "));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: rides.length,
          itemBuilder: (context, index) =>
              buildRideCard(rides[index], showAccept: false),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Driver'),
          backgroundColor: Colors.black,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'New'),
              Tab(icon: Icon(Icons.history), text: 'Tra'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildAvailableRidesTab(),
            buildMyRidesTab(),
          ],
        ),
      ),
    );
  }
}
