import 'package:challenge_application/core/commons/mg_container_error_message.dart';
import 'package:challenge_application/features/home_module/components/home_components/cubit/home_cubit.dart';
import 'package:challenge_application/features/home_module/components/home_components/cubit/home_state.dart';
import 'package:challenge_application/features/home_module/components/home_components/presentation/widgets/card_post_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeComponents extends StatelessWidget {
  final HomeCubit _homeCubit;

  const HomeComponents({
    super.key,
    required HomeCubit homeCubit,
  }) : _homeCubit = homeCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => _homeCubit,
        child: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit..getListPost(),
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.postList?.postOutput?.length ?? 0,
                  semanticChildCount: state.postList?.postOutput?.length,
                  itemBuilder: (context, index) {
                    final post = state.postList!.postOutput![index];
                    return PostCard(post: post);
                  },
                ),
              );
            }
            if (state is HomeNoInternet) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ErrorContainerMessage(
                      messagee: "Check your internet connection"),
                  IconButton(
                    onPressed: () => _homeCubit..getListPost(),
                    icon: const Icon(
                      Icons.replay_outlined,
                      size: 30,
                    ),
                  )
                ],
              );
            }

            if (state is HomeError) {
              return ErrorContainerMessage(messagee: state.error);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
