import 'package:challenge_application/core/entities/comment_entitie.dart';
import '../input_output/get_comments_use_case_input.dart';

abstract class GetCommentsRemoteRepository {
  Future<CommentEntitie?> getComments(GetCommentsInput inputId);
}
