import 'package:flutter/material.dart';
import '../widgets/access_log_entry.dart';

class AccessLogScreen extends StatefulWidget {
  const AccessLogScreen({super.key});

  @override
  State<AccessLogScreen> createState() => _AccessLogScreenState();
}

class _AccessLogScreenState extends State<AccessLogScreen> {
  // Sample access log data
  final List<AccessLogEntry> accessLogs = [
    AccessLogEntry(time: '02:35 PM', action: 'Accessed', status: 'Accepted'),
    AccessLogEntry(time: '12:53 AM', action: 'Change Pin', status: 'Accepted'),
    AccessLogEntry(time: '12:25 AM', action: 'Change Pin', status: 'Denied'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Lock icon
              Hero(
                tag: 'lockIcon',
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/front_door.png',
                      // Replace with your actual lock icon asset or use a placeholder
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // "Front Door" text
              const Text(
                'Front Door',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Access log options
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildAccessOption(
                      'Change Pin',
                      onTap: () {
                        Navigator.pushNamed(context, '/lock');
                      },
                    ),
                    const Divider(height: 1, color: Color(0xFF333333)),
                    _buildAccessOption(
                      'Access Logs',
                      onTap: () {
                        // Already on access logs screen
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Access logs
              Expanded(
                child: ListView.builder(
                  itemCount: accessLogs.length,
                  itemBuilder: (context, index) {
                    return _buildAccessLogItem(accessLogs[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccessOption(String title, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildAccessLogItem(AccessLogEntry log) {
    final Color statusColor = log.status == 'Accepted'
        ? const Color(0xFF2AA84E)
        : const Color(0xFFFF3B30);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  log.action,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            log.status,
            style: TextStyle(
              color: statusColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
