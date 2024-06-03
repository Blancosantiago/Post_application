import 'package:challenge_application/core/entities/comment_entitie.dart';
import '../input_output/get_comments_use_case_input.dart';
import '../repositories/get_comments_remote_repository.dart';
import 'get_comments_use_case.dart';

class GetCommentsUseCaseImpl implements GetCommentsUseCase {
  final GetCommentsRemoteRepository _remoteRepository;

  GetCommentsUseCaseImpl({
    required GetCommentsRemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  Future<CommentEntitie?> getComments(GetCommentsInput inputId) async {
    CommentEntitie? issues = await _remoteRepository.getComments(inputId);
    return issues;
  }
}
