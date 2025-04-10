import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _textColor = Colors.white.obs;
  final formKey = GlobalKey<FormState>();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  Color get textColor => _textColor.value;

  void signUp() {
    if (formKey.currentState!.validate()) {
      Get.offAll(HomeScreen());
    }
  }

  void updateTextColor(Color color) {
    _textColor.value = color;
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 210,
                width: screenWidth,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SizedBox(
                        width: screenWidth * 0.88,
                        child: Image.asset("assets/images/curved-lines.png"),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 20,
                      child: Image.asset(
                        "assets/images/lock.png",
                        width: 60,
                        height: 60,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Noortify",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF9936),
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                "Your security is our priority. Secure your Home with our services.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 175,
                width: screenWidth * 0.33,
                child: Image.asset("assets/images/straight-lines.png"),
              ),
              const Spacer(),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Obx(
                      () => TextFormField(
                        controller: controller.emailController,
                        style: TextStyle(color: controller.textColor),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorStyle: TextStyle(color: Colors.orange),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onChanged: (text) =>
                            controller.updateTextColor(Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        style: TextStyle(color: controller.textColor),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorStyle: TextStyle(color: Colors.orange),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        onChanged: (text) =>
                            controller.updateTextColor(Colors.white),
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: controller.signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF9936),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Sign up",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I have an account. ",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF808080),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(70, 32),
                    ),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
