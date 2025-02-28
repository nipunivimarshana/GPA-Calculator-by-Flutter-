import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GPAResultScreen.dart';

class CourseFormScreen extends StatefulWidget {
  @override
  _CourseFormScreenState createState() => _CourseFormScreenState();
}

class _CourseFormScreenState extends State<CourseFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Predefined course list with credit values
  final Map<String, int> courseList = {
    'Statistics': 3,
    'operating Systems': 3,
    'Green and Sustainable technology': 1,
    'App Development': 3,
    'Data Structures': 2,
    'AI & ML': 4,
    'Computer Networks': 3,
  };

  // Predefined list of credit values for dropdown
  final List<int> creditValues = [1, 2, 3, 4, 5];

  List<String?> selectedCourses = List.filled(6, null);
  List<int?> selectedCredits = List.filled(6, null);
  List<TextEditingController> grades =
      List.generate(6, (index) => TextEditingController());

  // Function to validate and submit the form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      List<String> enteredCourseNames = selectedCourses.map((e) => e!).toList();
      List<int> enteredCreditLevels = selectedCredits.map((e) => e!).toList();
      List<String> enteredGrades =
          grades.map((controller) => controller.text.toUpperCase()).toList();

      // Navigate to GPA Result Screen using GetX
      Get.to(() => GPAResultScreen(
            courseNames: enteredCourseNames,
            creditLevels: enteredCreditLevels,
            grades: enteredGrades,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Course Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                for (int i = 0; i < 6; i++) ...[
                  Text("Course ${i + 1}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),

                  // Course Selection Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedCourses[i],
                    hint: Text('Select a Course'),
                    items: courseList.keys.map((String course) {
                      return DropdownMenuItem<String>(
                        value: course,
                        child: Text(course),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCourses[i] = value;
                        selectedCredits[i] = courseList[value!];
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Select a course' : null,
                  ),
                  SizedBox(height: 8),

                  // Credit Value Dropdown
                  DropdownButtonFormField<int>(
                    value: selectedCredits[i],
                    hint: Text('Select Credit Value'),
                    items: creditValues.map((int credit) {
                      return DropdownMenuItem<int>(
                        value: credit,
                        child: Text(credit.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCredits[i] = value;
                      });
                    },
                    validator: (value) =>
                        value == null ? 'Select a credit value' : null,
                  ),
                  SizedBox(height: 8),

                  // Grade Input
                  TextFormField(
                    controller: grades[i],
                    decoration:
                        InputDecoration(labelText: 'Grade (A, B+, C, etc.)'),
                    validator: (value) => value!.isEmpty ? 'Enter Grade' : null,
                  ),
                  Divider(),
                ],
                SizedBox(height: 16),

                // Submit Button
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('SUBMIT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
