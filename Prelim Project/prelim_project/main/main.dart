import 'package:riverpod/riverpod.dart';
import 'package:rulona_project/providers.dart';
import 'dart:io';

final container = ProviderContainer();

void main() {
  final studentService = container.read(studentServiceProvider);

  while (true) {
    print('--- Student Management System ---');
    print('1. Add Student');
    print('2. Delete Student');
    print('3. View All Students');
    print('4. Edit Student');
    print('5. Exit');

    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        print('Enter student ID:');
        final studentId = stdin.readLineSync()!;
        print('Enter student name:');
        final studentName = stdin.readLineSync()!;
        print('Enter student grade:');
        final studentGrade = stdin.readLineSync()!;
        print('Enter student tuition:');
        final studentTuition = double.parse(stdin.readLineSync()!);
        studentService.addStudent(studentId, studentName, studentGrade, studentTuition);
        break;

      case '2':
        print('Enter student ID to delete:');
        final studentId = stdin.readLineSync()!;
        studentService.deleteStudent(studentId);
        break;

      case '3':
        final students = studentService.getAllStudents();
        print('--- All Students ---');
        if (students.isEmpty) {
          print('No students available.');
        } else {
          for (var student in students) {
            print('Student ID: ${student.id}, Name: ${student.name}, Grade: ${student.grade}, Tuition: ${student.tuition}');
          }
        }
        break;

      case '4':
        print('Enter student ID to edit:');
        final studentId = stdin.readLineSync()!;
        print('What would you like to edit?');
        print('1. Name');
        print('2. Grade');
        print('3. Tuition');
        final editChoice = stdin.readLineSync();

        switch (editChoice) {
          case '1':
            print('Enter new student name:');
            final studentName = stdin.readLineSync()!;
            studentService.editStudentName(studentId, studentName);
            break;

          case '2':
            print('Enter new student grade:');
            final studentGrade = stdin.readLineSync()!;
            studentService.editStudentGrade(studentId, studentGrade);
            break;

          case '3':
            print('Enter new student tuition:');
            final studentTuition = double.parse(stdin.readLineSync()!);
            studentService.editStudentTuition(studentId, studentTuition);
            break;

          default:
            print('Invalid option. Please try again.');
        }
        break;

      case '5':
        print('Exiting system...');
        exit(0);

      default:
        print('Invalid option. Please try again.');
    }
  }
}
