import 'package:challenge_application/core/entities/error_entitie.dart';
import 'package:challenge_application/core/entities/post_entitie.dart';

import '../input_output/get_post_use_case_input.dart';
import '../input_output/get_post_use_case_output.dart';
import '../repositories/get_post_remote_repository.dart';
import '../../../../../abstractions/http_client.dart';

class GetPostRemoteRepositoryImplement implements GetPostRemoteRepository {
  final String _baseUrl;
  final HttpClient _httpClient;
  static const String _getPostEndpointUrl = '/posts';

  GetPostRemoteRepositoryImplement({
    required String baseUrl,
    required HttpClient httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient;
  @override
  Future<PostEntitie?> getPost(GetPostInput imput) async {
    var url = "$_baseUrl$_getPostEndpointUrl";

    var response = await _httpClient.get(
      url,
    );
    if (response.isOk()) {
      List<GetPostOutput> posts = [];

      response.data
          .map((data) => posts.add(GetPostOutput.fromMap(data)))
          .toList();

      return PostEntitie(postOutput: posts);
    } else {
      return PostEntitie(errorMenssage: ErrorMenssage());
    }
  }
}
