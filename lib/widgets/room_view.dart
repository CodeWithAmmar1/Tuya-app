import 'package:flutter/material.dart';
import 'room_card.dart';
import 'device_card.dart';

class RoomView extends StatelessWidget {
  final String objectType;
  final List objectsList;

  const RoomView({
    super.key,
    required this.objectType,
    required this.objectsList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GridView.builder(
        itemCount: objectsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          // Determine which widget to show based on the objectType
          if (objectType == "room") {
            return RoomCard(
                room: objectsList[
                    index]); // Show RoomCard if objectType is "room"
          } else {
            return DeviceCard(
                device: objectsList[
                    index]); // Show DeviceCard if objectType is "device"
          }
        },
      ),
    );
  }
}
