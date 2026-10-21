import 'package:lms_layered_architecture_example/model/student.dart';
import 'package:lms_layered_architecture_example/model/course.dart';
import 'package:lms_layered_architecture_example/model/course_result.dart';
class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> scores = [];
  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }
  

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  } 

  void removeStudent({required String studentId}){ {
      Student? stu = _findStudentOrNull(studentId);
      if (stu == null) {
        throw Exception('Student $studentId not found');
      }

      students.removeWhere((student) => student.id == studentId);

      scores.removeWhere((score) => score.studentId == studentId);
      courses.forEach((c)=> c.studentIds.remove(studentId));
    }
  }
  
  Course? _findCourseOrNull(String courseId ){
    return courses.where((s)=> s.id == courseId).firstOrNull;
  }

  void addCourse({required String courseId, required String courseName}){
    Course? course = _findCourseOrNull(courseId);
    if(course != null) throw Exception('Course $course already exists');
    courses.add(Course(id: courseId, name: courseName));

  }

  void removeCourse({required String courseId}){
    Course? course = _findCourseOrNull(courseId);
    if(course == null) throw Exception('Course $courseId not found');
    int nStu = course.studentIds.length;
    if(nStu !=0) throw Exception('Cannot remove this $courseId, there are $nStu students are enrolled in this course');
    CourseResult? hasRecord = scores.where((score)=> score.courseId == courseId).firstOrNull;
    if(hasRecord != null) throw Exception('Cannot remove this $courseId. Its result has been recoded: ${hasRecord.score}');
    courses.removeWhere((c)=> c.id == courseId);

  }

  void enrollStudent({required String studentId, required String courseId}){
    Student? stu = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);
  if(stu == null) throw Exception('Student $stu.id not found');
  if(course == null) throw Exception('Course $course.id not found');
  if(course.studentIds.any((stuId)=> stuId == studentId)) throw Exception('Student $studentId already enrolled in this course');

  course.studentIds.add(stu.id);
  }
  void  discardStudentFromCourse({required String studentId, required String courseId}){
    Student? stu = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);
    if(stu == null) throw Exception('Student $stu.id not found');
    if(course == null) throw Exception('Course $course.id not found');
    if(!course.studentIds.any((stuId)=> stuId == studentId)) throw Exception('Student $studentId is not enrolled in this course');
    
    CourseResult? score = scores.where((score) => score.studentId == studentId && score.courseId == courseId).firstOrNull;
    if(score != null) scores.remove(score);
    course.studentIds.remove(studentId);
      
  }




  void addResult({required int score, required String studentId, required String courseId}){
    Student? stu = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);

    if(stu == null) throw Exception('Student $stu.id not found');
    if(course == null) throw Exception('Course $course.id not found');
    if(score<0 || score>100) throw Exception('Score $score is invalid. It must be between 0 and 100');

  
    if(scores.any((s)=> s.studentId == studentId && s.courseId == courseId)) throw Exception('Score for student $studentId in course $courseId already exists');

    scores.add(CourseResult(id: scores.length, score: score, courseId: courseId, studentId: studentId));
  }


  void removeResult({required int resultId}){
    CourseResult? score = scores.where((s)=> s.id == resultId).firstOrNull;
    if(score == null) throw Exception('Score $resultId not found');
    scores.remove(score);
  }


}
