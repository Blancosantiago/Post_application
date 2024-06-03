import 'package:challenge_application/core/entities/post_entitie.dart';
import '../input_output/get_post_use_case_input.dart';
import '../repositories/get_post_remote_repository.dart';
import 'get_post_use_case.dart';

class GetPostUseCaseImpl implements GetPostUseCase {
  final GetPostRemoteRepository _remoteRepository;

  GetPostUseCaseImpl({
    required GetPostRemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  Future<PostEntitie?> getPost(GetPostInput inputId) async {
    PostEntitie? postList = await _remoteRepository.getPost(inputId);
    return postList;
  }
}
