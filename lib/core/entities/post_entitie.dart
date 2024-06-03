import 'package:challenge_application/core/entities/error_entitie.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/input_output/get_post_use_case_output.dart';

class PostEntitie {
  final List<GetPostOutput>? postOutput;
  final ErrorMenssage? errorMenssage;

  PostEntitie({this.postOutput, this.errorMenssage});
}
