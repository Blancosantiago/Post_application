import 'package:challenge_application/core/commons/mg_container_error_message.dart';
import 'package:challenge_application/features/home_module/components/comments_components/cubit/comments_cubit.dart';
import 'package:challenge_application/features/home_module/components/comments_components/cubit/comments_state.dart';
import 'package:challenge_application/features/home_module/components/comments_components/presentation/widgets/card_post_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsComponents extends StatelessWidget {
  final CommentsCubit _commentsCubit;
  final int? _id;
  const CommentsComponents({
    super.key,
    required CommentsCubit commentsCubit,
    int? id,
  })  : _commentsCubit = commentsCubit,
        _id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comments $_id"),
      ),
      body: BlocProvider(
        create: (context) => _commentsCubit,
        child: BlocBuilder<CommentsCubit, CommentsState>(
          bloc: _commentsCubit..getListComments(_id ?? 1),
          builder: (context, state) {
            if (state is CommentsLoaded) {
              return Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.comments?.commentsOutput?.length ?? 0,
                  semanticChildCount: 5,
                  itemBuilder: (context, index) {
                    final comments = state.comments!.commentsOutput?[index];
                    return CommentCard(comment: comments!);
                  },
                ),
              );
            }
            if (state is CommentsNoInternet) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ErrorContainerMessage(
                      messagee: "Check your internet connection"),
                  IconButton(
                    onPressed: () => _commentsCubit..getListComments(_id ?? 1),
                    icon: const Icon(
                      Icons.replay_outlined,
                      size: 30,
                    ),
                  )
                ],
              );
            }

            if (state is CommentsError) {
              return ErrorContainerMessage(
                messagee: state.error?.messageError,
              );
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
