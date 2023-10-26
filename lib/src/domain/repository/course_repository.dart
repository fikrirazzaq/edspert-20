import '../../data/model/model.dart';
import '../entity/course_list_response_entity.dart';
import '../entity/exercise_list_response_entity.dart';
import '../entity/exercise_result_response_entity.dart';
import '../entity/question_list_response_entity.dart';

abstract class CourseRepository {
  /// Course List
  Future<List<CourseDataEntity>?> getCourses(String majorName);

  /// Exercise List
  Future<List<ExerciseDataEntity>?> getExercisesByCourse(String courseId);

  /// Do Exercise
  Future<QuestionListResponseEntity> getQuestionsByExercise(String exerciseId);
  Future<bool> submitExerciseAnswer(SubmitAnswerRequestModel request);
  Future<ExerciseResultResponseEntity> getExerciseResult(String exerciseId);
}
