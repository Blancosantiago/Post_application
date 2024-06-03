import 'package:challenge_application/core/entities/comment_entitie.dart';
import 'package:challenge_application/core/entities/error_entitie.dart';
import 'package:challenge_application/core/services/internet_status_check_service/internet_status_check_service.dart';
import 'package:challenge_application/features/home_module/components/comments_components/cubit/comments_state.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/input_output/get_comments_use_case_input.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/interactor/get_comments_use_case_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final GetCommentsUseCaseImpl _getCommentsUseCaseImpl;
  final NetworkInfo? _networkInfo;
  CommentsCubit({
    required GetCommentsUseCaseImpl getCommentsUseCaseImpl,
    NetworkInfo? networkInfo,
  })  : _getCommentsUseCaseImpl = getCommentsUseCaseImpl,
        _networkInfo = networkInfo,
        super(CommentsInitial());

  getListComments(int id) async {
    emit(CommentsLoading());

    bool? hasConnection = await _networkInfo?.isConnected();
    if (hasConnection == null || !hasConnection) {
      emit(CommentsNoInternet());
      return;
    }

    try {
      CommentEntitie? listComments =
          await _getCommentsUseCaseImpl.getComments(GetCommentsInput(id: id));
      if (listComments != null) {
        emit(
          CommentsLoaded(
            comments: listComments,
          ),
        );
      } else {
        emit(
          CommentsError(
            error: listComments?.errorMenssage ??
                ErrorMenssage(messageError: "Something went wrong"),
          ),
        );
      }
    } catch (error) {
      emit(
        CommentsError(
          error: ErrorMenssage(messageError: error.toString()),
        ),
      );
    }
  }
}
