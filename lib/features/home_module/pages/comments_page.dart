import 'package:challenge_application/features/home_module/components/comments_components/cubit/comments_cubit.dart';
import 'package:challenge_application/features/home_module/components/comments_components/presentation/comments_components.dart';
import 'package:challenge_application/infrastructure/ioc_m.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  final dynamic _id;
  const CommentsPage({super.key, dynamic id}) : _id = id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildHomePageComponents(context));
  }

  _buildHomePageComponents(BuildContext context) {
    return CommentsComponents(
      commentsCubit: IocManager.getInstance().resolve<CommentsCubit>(),
      id: _id,
    );
  }
}
