import 'package:challenge_application/core/entities/post_entitie.dart';
import '../input_output/get_post_use_case_input.dart';

abstract class GetPostUseCase {
  Future<PostEntitie?> getPost(GetPostInput inputId);
}
