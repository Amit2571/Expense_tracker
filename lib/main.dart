//importing packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_and_signup/pages/analytics_page/analytics_page.dart';
import 'package:login_and_signup/pages/catregoryPages/bills.dart';
import 'package:login_and_signup/pages/home_page/home_page.dart';
import 'package:login_and_signup/pages/home_page/home_page_part2.dart';
import 'package:login_and_signup/pages/insert_transactions/insert_transactions.dart';
import 'package:login_and_signup/pages/login_and_signup_page/auth_page.dart';
import 'package:login_and_signup/pages/login_and_signup_page/forgot_password_page.dart';
import 'package:login_and_signup/pages/catregoryPages/testGrocery.dart';
import 'package:login_and_signup/pages/user_page/set_goal.dart';
import 'package:login_and_signup/pages/user_page/user_page.dart';
import 'firebase_options.dart';
import 'package:login_and_signup/pages/introduction pages/onboarding_screen.dart';

//importing pages

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
//main() ends

class MyApp extends StatelessWidget {
  //

  //
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      //home: AuthPage(),
      home: OnBoardingScreen(),
      //home: AnalyticsPage(),
      //home: InsertTransactionsPage(),
      //home: UserPage(),
      //home: ForgotPasswordPage(),
      //home: Homepage(),
      //home: HomePagePart2(),
      //home: SetGoal(title: 'Set Goal'),
      //home: GroceryPage(),
      //home: BillsPage(),
    );
  }
}
//class MyApp ends
