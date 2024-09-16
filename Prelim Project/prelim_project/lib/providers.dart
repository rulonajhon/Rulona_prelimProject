import 'package:riverpod/riverpod.dart';
import 'models/students.dart';

class StudentService {
  final List<Student> _students = [];

  void addStudent(String id, String name, String grade, double tuition) {
    _students.add(Student(id, name, grade, tuition));
  }

  void deleteStudent(String id) {
    _students.removeWhere((student) => student.id == id);
  }

  List<Student> getAllStudents() {
    return _students;
  }

  void editStudentName(String id, String name) {
    for (var student in _students) {
      if (student.id == id) {
        student.name = name;
        break;
      }
    }
  }

  void editStudentGrade(String id, String grade) {
    for (var student in _students) {
      if (student.id == id) {
        student.grade = grade;
        break;
      }
    }
  }

  void editStudentTuition(String id, double tuition) {
    for (var student in _students) {
      if (student.id == id) {
        student.tuition = tuition;
        break;
      }
    }
  }
}

final studentServiceProvider = Provider((ref) => StudentService());
