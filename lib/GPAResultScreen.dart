import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GPAResultScreen extends StatelessWidget {
  final List<String> courseNames;
  final List<int> creditLevels;
  final List<String> grades;

  GPAResultScreen({
    required this.courseNames,
    required this.creditLevels,
    required this.grades,
  });

  // Here is the function to convert letter grades to grade points
  double getGradePoint(String grade) {
    switch (grade.toUpperCase()) {
      case 'A+':
      case 'A':
        return 4.0;
      case 'A-':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'B-':
        return 2.7;
      case 'C+':
        return 2.3;
      case 'C':
        return 2.0;
      case 'C-':
        return 1.7;
      case 'D+':
        return 1.3;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }

  // Function to calculate GPA
  double calculateGPA() {
    double totalPoints = 0;
    int totalCredits = 0;

    for (int i = 0; i < courseNames.length; i++) {
      double gradePoint = getGradePoint(grades[i]);
      int credit = creditLevels[i];

      totalPoints += gradePoint * credit;
      totalCredits += credit;
    }

    if (totalCredits == 0) return 0.0;
    return double.parse((totalPoints / totalCredits)
        .toStringAsFixed(2)); // Rounded to 2 decimal places
  }

  @override
  Widget build(BuildContext context) {
    double gpa = calculateGPA();

    return Scaffold(
      appBar: AppBar(title: Text('GPA Result')),
      body: Center(
        // Ensures everything is centered
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center content vertically
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your GPA is:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                gpa.toStringAsFixed(2), // Display GPA with 2 decimal places
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text('Go Back',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
