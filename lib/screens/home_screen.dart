import 'package:flutter/material.dart';
import '../models/room.dart';
import '../models/security_device.dart';
import '../data/sample_rooms.dart';
import '../data/sample_devices.dart';
import '../widgets/button.dart';
import '../widgets/room_view.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Room> rooms = SampleRooms.data;
  final List<SecurityDevice> livingDevices =
      SampleDevices.getLivingRoomDevices();
  final List<SecurityDevice> bathDevices = SampleDevices.getBathroomDevices();
  final List<SecurityDevice> diningDevices =
      SampleDevices.getDiningRoomDevices();
  final List<SecurityDevice> bedDevices = SampleDevices.getBedroomDevices();

  @override
  void initState() {
    super.initState();
  }

  List<SecurityDevice> getAllItems() {
    return [
      ...livingDevices,
      ...bathDevices,
      ...diningDevices,
      ...bedDevices,
    ];
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/homepage-img.png", height: 175),
            Expanded(child: _buildTabController()),
            const SizedBox(height: 4),
            Center(child: Button(text: "Add a device", onPressed: () {})),
          ],
        ),
      ),
    );
  }

  Widget _buildTabController() {
    return DefaultTabController(
      length: rooms.length + 1,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              const Tab(text: "All Rooms"),
              for (final room in rooms) Tab(text: room.name),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: TabBarView(
                physics: const ClampingScrollPhysics(),
                children: [
                  RoomView(objectType: "device", objectsList: getAllItems()),
                  RoomView(objectType: "device", objectsList: livingDevices),
                  RoomView(objectType: "device", objectsList: bathDevices),
                  RoomView(objectType: "device", objectsList: diningDevices),
                  RoomView(objectType: "device", objectsList: bedDevices),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildHomeContent(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // Set the initial index
        onTap: (index) {
          // Handle navigation logic here
          print("Tapped on index: $index");
        },
      ),
    );
  }
}
