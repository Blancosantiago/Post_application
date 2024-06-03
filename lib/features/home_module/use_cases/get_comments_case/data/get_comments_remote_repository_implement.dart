import 'dart:io';
import 'package:challenge_application/core/entities/comment_entitie.dart';
import 'package:challenge_application/core/entities/error_entitie.dart';
import 'package:challenge_application/core/services/channels_ios_services/channels_ios_services_implements.dart';
import 'package:flutter/services.dart';
import '../input_output/get_comments_use_case_input.dart';
import '../input_output/get_comments_use_case_output.dart';
import '../repositories/get_comments_remote_repository.dart';
import '../../../../../abstractions/http_client.dart';

class GetCommentsRemoteRepositoryImplement
    implements GetCommentsRemoteRepository {
  final String _baseUrl;
  final HttpClient _httpClient;
  static const String _getCommentsEndpointUrl = '/comments?postId=';

  GetCommentsRemoteRepositoryImplement({
    required String baseUrl,
    required HttpClient httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient;
  @override
  Future<CommentEntitie?> getComments(GetCommentsInput input) async {
    final url = '$_baseUrl$_getCommentsEndpointUrl${input.id}';
    if (Platform.isAndroid) {
      return _getCommentsFromAndroid(input.id, url);
    } else if (Platform.isIOS) {
      return _getCommentsFromIOS(input.id, url, {});
    }
    return null;
  }

  Future<CommentEntitie?> _getCommentsFromAndroid(
      int postId, String url) async {
    try {
      final response = await _httpClient.get(url);
      if (response.isOk()) {
        return CommentEntitie(
            commentsOutput: response.data
                .map<GetCommentsOutput>(
                    (data) => GetCommentsOutput.fromMap(data))
                .toList());
      } else {
        return CommentEntitie(
            errorMenssage: ErrorMenssage(messageError: "no description error"));
      }
    } catch (e) {
      return CommentEntitie(
          errorMenssage: ErrorMenssage(messageError: e.toString()));
    }
  }

  Future<CommentEntitie?> _getCommentsFromIOS(
      int postId, String url, Map<String, String> headers) async {
    try {
      final result = await ChannelsIosServicesImplements().getChannel(url);
      final List<dynamic> postmna = result;

      return CommentEntitie(
          commentsOutput: postmna
              .map<GetCommentsOutput>((item) => GetCommentsOutput.fromMap(item))
              .toList());
    } on PlatformException catch (e) {
      return CommentEntitie(
          errorMenssage: ErrorMenssage(messageError: e.message));
    }
  }
}
