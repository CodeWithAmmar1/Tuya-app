import 'package:flutter/material.dart';
import '../models/security_device.dart';

class SampleDevices {
  static List<SecurityDevice> getLivingRoomDevices() {
    return [
      SecurityDevice(
        name: "Tuya Front Door",
        image: Image.asset("assets/images/tuya-door.png"),
        status: '',
        id: '', // Optional empty ID
        iconPath: '',
      ),
      SecurityDevice(
        name: "Back Door",
        image: Image.asset("assets/images/back-door.png"),
        status: '',
        id: '',
        iconPath: '',
      ),
      SecurityDevice(
        name: "Main Door",
        image: Image.asset("assets/images/main-door.png"),
        status: '',
        id: '',
        iconPath: '',
      ),
    ];
  }

  static List<SecurityDevice> getBathroomDevices() {
    return [
      SecurityDevice(
        name: "Bathroom Door",
        image: Image.asset("assets/images/main-door.png"),
        status: '',
        id: '',
        iconPath: '',
      ),
      SecurityDevice(
        name: "Bathroom Window",
        image: Image.asset("assets/images/back-door.png"),
        status: '',
        id: 'true',
        iconPath: '',
      ),
      SecurityDevice(
        name: "Bathroom Light",
        image: Image.asset("assets/images/tuya-door.png"),
        status: '',
        id: 'true',
        iconPath: '',
      ),
    ];
  }

  static List<SecurityDevice> getDiningRoomDevices() {
    return [
      SecurityDevice(
        name: "Dining Door",
        image: Image.asset("assets/images/tuya-door.png"),
        status: '',
        id: 'true',
        iconPath: '',
      ),
      SecurityDevice(
        name: "Dining Window",
        image: Image.asset("assets/images/back-door.png"),
        status: '',
        id: 'true',
        iconPath: '',
      ),
    ];
  }

  static List<SecurityDevice> getBedroomDevices() {
    return [
      SecurityDevice(
        name: "Bedroom Door",
        image: Image.asset("assets/images/main-door.png"),
        status: '',
        id: '',
        iconPath: '',
      ),
      SecurityDevice(
        name: "Bedroom Window",
        image: Image.asset("assets/images/back-door.png"),
        status: '',
        iconPath: '',
        id: '',
      ),
      SecurityDevice(
        name: "Bedroom Light",
        image: Image.asset("assets/images/tuya-door.png"),
        status: '',
        id: '',
        iconPath: '',
      ),
      SecurityDevice(
        name: "Bedroom AC",
        image: Image.asset("assets/images/main-door.png"),
        status: '',
        id: '',
        iconPath: '',
      ),
    ];
  }
}
