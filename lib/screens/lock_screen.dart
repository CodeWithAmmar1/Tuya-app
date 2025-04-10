import 'package:flutter/material.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  String enteredPin = '';

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

              /// Lock Icon
              Hero(
                tag: 'lockIcon',
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/access_log');
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/front_door.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Front Door Text
              const Text(
                'Front Door',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// Change Pin
              GestureDetector(
                onTap: () {
                  // Implement change pin logic here
                },
                child: const Text(
                  'Change Pin',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),

              const SizedBox(height: 20),

              /// PIN Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index < enteredPin.length
                          ? const Color(0xFFFF9936)
                          : Colors.grey.withAlpha(77),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Number Pad
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index == 9) {
                      return const SizedBox();
                    } else if (index == 10) {
                      return _buildNumberButton('0');
                    } else if (index == 11) {
                      return _buildBackspaceButton();
                    } else {
                      return _buildNumberButton('${index + 1}');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return InkWell(
      onTap: () {
        if (enteredPin.length < 4) {
          setState(() {
            enteredPin += number;
          });
          if (enteredPin.length == 4) {
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                enteredPin = '';
              });
            });
          }
        }
      },
      borderRadius: BorderRadius.circular(40),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return InkWell(
      onTap: () {
        if (enteredPin.isNotEmpty) {
          setState(() {
            enteredPin = enteredPin.substring(0, enteredPin.length - 1);
          });
        }
      },
      borderRadius: BorderRadius.circular(40),
      child: const Center(
        child: Icon(
          Icons.backspace_outlined,
          color: Color(0xFFFF9936),
          size: 24,
        ),
      ),
    );
  }
}
