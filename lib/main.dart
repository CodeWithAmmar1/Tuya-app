import 'package:app/screens/Login_Screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuya_home_sdk_flutter/tuya_home_sdk_flutter.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await TuyaHomeSdkFlutter.instance.initSdk(
    '4atqfcthqrpr5fwxrmcy', 
    'endshkhrc78v3tsa98nmx7wt7rruys4t', 
    'ap', 
  );
  
  runApp(GetMaterialApp(    
   

    debugShowCheckedModeBanner: false,
    initialRoute: '/signup',
    getPages: [
      GetPage(name: '/signup', page: () => SignupScreen()),
      GetPage(name: '/home', page: () => HomeScreen()),
    ],
  ));
}
