
import 'package:lms_layered_architecture_example/model/course.dart';
import 'package:test/test.dart';
import  '../lib/service/lms_system.dart';

void main() {
    final lms = LmsSystem();
    setUp(() {
      lms.students.clear();
      lms.courses.clear();
      lms.scores.clear();
    });
  test('creates a student', () {

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");
    expect(lms.students.first.name, 'ronan');
    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });


  //course test cases
  test('add and remove course',(){
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    expect(lms.courses.first.name, 'algorithms');
    lms.removeCourse(courseId: 'ALG');
    expect(lms.courses.length, 0);
  });

  test('Reject a duplicate course ID',(){
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    expect(() => lms.addCourse(courseId: 'ALG', courseName: 'algorithms'), throwsException);
  });
  test('Reject removal of a nonexistent course. ', (){
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.removeCourse(courseId: 'ALG');
    expect(() => lms.removeCourse(courseId: 'ALG'), throwsException);
  });

  test('Enroll an existing student in an existing course', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    Course? course = lms.courses.where((c) => c.id == 'ALG').firstOrNull;
    expect(course?.studentIds.contains('S1'), true);
  });

  test('rejects enrollment, the student does not exist', (){
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'ALG'), throwsException);
  });

  test('Reject enrollment, the course does not exist', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'ALG'), throwsException);
  });

  test('Reject duplicate enrollment', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'ALG'), throwsException);
  });

  //remove student from course test cases

  test('remove an enrolled student from a course', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    lms.addResult(studentId: 'S1', courseId: 'ALG', score: 85);
    lms.discardStudentFromCourse(studentId: 'S1', courseId: 'ALG');
    Course? course = lms.courses.where((c) => c.id == 'ALG').firstOrNull;
    expect(course?.studentIds.contains('S1'), false);
    expect(lms.scores.length, 0);


    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
  });

  test('rejects removal, the student is not enrolled', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    expect(() => lms.discardStudentFromCourse(studentId: 'S1', courseId: 'ALG'), throwsException);
  });

  test('Only add the score for an enrolled student once', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    lms.addResult(studentId: 'S1', courseId: 'ALG', score: 85);
    expect(() => lms.addResult(studentId: 'S1', courseId: 'ALG', score: 90), throwsException);
  });

  test('Remove student who has enrolled in mutiple courses', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.addCourse(courseId: 'DS', courseName: 'data structures');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    lms.enrollStudent(studentId: 'S1', courseId: 'DS');
    lms.removeStudent(studentId: 'S1');
    Course? course1 = lms.courses.where((c) => c.id == 'ALG').firstOrNull;
    Course? course2 = lms.courses.where((c) => c.id == 'DS').firstOrNull;

    expect(course1?.studentIds.contains('S1'), false);
    expect(course2?.studentIds.contains('S1'), false);
  });


  // add a score to a course

  test('add a valid score', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    lms.addResult(studentId: 'S1', courseId: 'ALG', score: 85);
    expect(lms.scores.first.score, 85);
  });

  test('Reject a result for a nonexistent student or course', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');

    expect(() => lms.addResult(studentId: 'S2', courseId: 'ALG', score: 85), throwsException);
    expect(() => lms.addResult(studentId: 'S1', courseId: 'DS', score: 85), throwsException);
  });

  test('Reject invalid score', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');

    expect(() => lms.addResult(studentId: 'S1', courseId: 'ALG', score: -5), throwsException);
  });

  test('rejects duplicate score entry for same student and course', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    lms.addResult(studentId: 'S1', courseId: 'ALG', score: 85);

    expect(() => lms.addResult(studentId: 'S1', courseId: 'ALG', score: 90), throwsException);
  });


  // remove a student result

  test('remove exisiting result', (){
    lms.addStudent(studentId: 'S1', studentName: "Light");
    lms.addStudent(studentId: 'S2', studentName: "Laluce");
    lms.addCourse(courseId: 'ALG', courseName: 'algorithms');
    lms.addCourse(courseId: 'DB', courseName: 'database');
    lms.enrollStudent(studentId: 'S1', courseId: 'ALG');
    lms.addResult(studentId: 'S1', courseId: 'ALG', score: 85);
    lms.enrollStudent(studentId: 'S2', courseId: 'DB');
    lms.addResult(studentId: 'S2', courseId: 'DB', score: 90);

    lms.removeResult(resultId: 0);
    expect(lms.scores.any((score)=> score.id == 0), false);
    expect(lms.courses.length, 2);
    expect(lms.students.length, 2);
    expect(lms.scores.length, 1);
  });

  test('rejects removal of a nonexistent result', (){
    expect(() => lms.removeResult(resultId: 1), throwsException);
  });
 }
