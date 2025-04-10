import 'package:flutter/material.dart';

class AccessLog {
  final DateTime timestamp;
  final String action;
  final String user;

  AccessLog({
    required this.timestamp,
    required this.action,
    required this.user,
  });
}

class SecurityDevice {
  final String id;
  final String name;
  final String status;
  final String iconPath;
  final Image image;
  final int? pin; // Optional field
  final List<AccessLog>? accessLogs; // Optional field

  SecurityDevice({
    required this.id,
    required this.name,
    required this.status,
    required this.iconPath,
    required this.image,
    this.pin,
    this.accessLogs,
  });
}
