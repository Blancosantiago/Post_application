import 'package:challenge_application/abstractions/http_client.dart';
import 'package:challenge_application/abstractions/injector.dart';
import 'package:challenge_application/application/application_navigator.dart';
import 'package:challenge_application/core/services/internet_status_check_service/internet_status_check_service.dart';
import 'package:challenge_application/features/home_module/components/comments_components/cubit/comments_cubit.dart';
import 'package:challenge_application/features/home_module/components/home_components/cubit/home_cubit.dart';
import 'package:challenge_application/features/home_module/pages/comments_page.dart';
import 'package:challenge_application/features/home_module/pages/home_page.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/data/get_comments_remote_repository_implement.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/interactor/get_comments_use_case.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/interactor/get_comments_use_case_implement.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/repositories/get_comments_remote_repository.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/data/get_post_remote_repository_implement.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/interactor/get_post_use_case.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/interactor/get_post_use_case_implement.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/repositories/get_post_remote_repository.dart';
import 'package:go_router/go_router.dart';

abstract class HomeModule {
  static const String homePage = '/homepage';
  static const String commentsPage = '/commentsPage';
  static List<GoRoute> generateRoutes() {
    return [
      GoRoute(
        name: homePage,
        path: homePage,
        pageBuilder: (context, state) =>
            NavigatorGoRouteApp.buildPageWithDefaultTransition(
                context: context, state: state, child: const HomePage()),
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: commentsPage,
        path: commentsPage,
        pageBuilder: (context, state) =>
            NavigatorGoRouteApp.buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: CommentsPage(
                  id: state.extra,
                )),
        builder: (context, state) => CommentsPage(
          id: state.extra,
        ),
      ),
    ];
  }

  static void registerDependencies(Injector injector) {
    _registerGetPostFeature(injector);
    _registerGetCommentsFeature(injector);
  }

  static void _registerGetPostFeature(Injector injector) {
    injector.registerFactory<GetPostRemoteRepository>(
      () => GetPostRemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );
    injector.registerFactory<GetPostUseCase>(
      () => GetPostUseCaseImpl(
        remoteRepository: injector.resolve<GetPostRemoteRepository>(),
      ),
    );
    injector.registerFactory<GetPostUseCaseImpl>(
      () => GetPostUseCaseImpl(
        remoteRepository: injector.resolve<GetPostRemoteRepository>(),
      ),
    );

    injector.registerFactory<GetPostRemoteRepository>(
      () => GetPostRemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );

    injector.registerFactory<HomeCubit>(
      () => HomeCubit(
        networkInfo: injector.resolve<NetworkInfo>(),
        getPostUseCaseImpl: injector.resolve<GetPostUseCaseImpl>(),
      ),
    );
  }

  static void _registerGetCommentsFeature(Injector injector) {
    injector.registerFactory<GetCommentsRemoteRepository>(
      () => GetCommentsRemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );
    injector.registerFactory<GetCommentsUseCase>(
      () => GetCommentsUseCaseImpl(
        remoteRepository: injector.resolve<GetCommentsRemoteRepository>(),
      ),
    );
    injector.registerFactory<GetCommentsUseCaseImpl>(
      () => GetCommentsUseCaseImpl(
        remoteRepository: injector.resolve<GetCommentsRemoteRepository>(),
      ),
    );

    injector.registerFactory<GetCommentsRemoteRepository>(
      () => GetCommentsRemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );

    injector.registerFactory<CommentsCubit>(
      () => CommentsCubit(
        networkInfo: injector.resolve<NetworkInfo>(),
        getCommentsUseCaseImpl: injector.resolve<GetCommentsUseCaseImpl>(),
      ),
    );
  }
}
