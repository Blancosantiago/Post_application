import 'package:challenge_application/core/entities/error_entitie.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/input_output/get_comments_use_case_output.dart';

class CommentEntitie {
  final List<GetCommentsOutput>? commentsOutput;
  final ErrorMenssage? errorMenssage;

  CommentEntitie({this.commentsOutput, this.errorMenssage});
}
