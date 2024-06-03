import 'package:bloc/bloc.dart';
import 'package:challenge_application/core/entities/post_entitie.dart';
import 'package:challenge_application/core/services/internet_status_check_service/internet_status_check_service.dart';
import 'package:challenge_application/features/home_module/components/home_components/cubit/home_state.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/input_output/get_post_use_case_input.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/interactor/get_post_use_case_implement.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPostUseCaseImpl _getPostUseCaseImpl;
  final NetworkInfo? _networkInfo;

  HomeCubit({
    required GetPostUseCaseImpl getPostUseCaseImpl,
    NetworkInfo? networkInfo,
  })  : _getPostUseCaseImpl = getPostUseCaseImpl,
        _networkInfo = networkInfo,
        super(HomeInitial());

  Future<void> getListPost() async {
    emit(HomeLoading());

    bool? hasConnection = await _networkInfo?.isConnected();
    if (hasConnection == null || !hasConnection) {
      emit(HomeNoInternet());
      return;
    }

    try {
      PostEntitie? listPost = await _getPostUseCaseImpl.getPost(GetPostInput());
      if (listPost != null) {
        emit(
          HomeLoaded(
            postList: listPost,
          ),
        );
      } else {
        emit(const HomeError(error: "Error fetching posts"));
      }
    } catch (error) {
      emit(HomeError(error: error.toString()));
    }
  }
}
