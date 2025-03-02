import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CourseFormScreen.dart';
import 'GPAResultScreen.dart';

void main() {
  runApp(MyApp());
}

/// Here is the Main App Widget including a color theme and navigation
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.purple.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.deepPurple.shade900),
          bodyMedium: TextStyle(color: Colors.deepPurple.shade700),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.shade100,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade600, width: 2),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.purple.shade300,
          backgroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GPA Calculator')),
      body: Center(
        child: Text(
          'Welcome to GPA Calculator',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Course Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'GPA Result',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Get.to(CourseFormScreen());
          } else {
            /// Passing empty lists as default values
            Get.to(GPAResultScreen(
              courseNames: List.filled(6, ''),
              creditLevels: List.filled(6, 0),
              grades: List.filled(6, ''),
            ));
          }
        },
      ),
    );
  }
}
