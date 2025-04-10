import 'package:flutter/material.dart';
import '../models/security_device.dart';
import '../data/sample_devices.dart';
import '../widgets/button.dart';
import '../widgets/device_card.dart';

class SearchScreen extends StatelessWidget {
  final List<SecurityDevice> devices;

  // Combining all devices from different rooms for the search screen
  SearchScreen({super.key})
      : devices = [
          ...SampleDevices.getLivingRoomDevices(),
          ...SampleDevices.getBathroomDevices(),
          ...SampleDevices.getDiningRoomDevices(),
          ...SampleDevices.getBedroomDevices(),
        ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${devices.length} new device(s)",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: devices.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.95,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index < devices.length) {
                    return DeviceCard(device: devices[index]);
                  } else {
                    return _buildNotFoundDeviceCard(context);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(child: Button(text: "Add device", onPressed: () {})),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNotFoundDeviceCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.home_outlined,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Not found device?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFFFF9936),
              padding: EdgeInsets.zero,
              minimumSize: Size(100, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: const Text(
              "Select manually",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
