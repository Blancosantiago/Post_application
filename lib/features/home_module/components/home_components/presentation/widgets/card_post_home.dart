import 'package:challenge_application/application/application_navigator.dart';
import 'package:challenge_application/application/application_themes.dart';
import 'package:challenge_application/core/commons/mg_text_simple_body.dart';
import 'package:challenge_application/features/home_module/home_modulte.dart';
import 'package:challenge_application/features/home_module/use_cases/get_post_case/input_output/get_post_use_case_output.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final GetPostOutput _post;

  const PostCard({
    super.key,
    required GetPostOutput post,
  }) : _post = post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => NavigatorGoRouteApp.navigatorPushNamed(
          argument: _post.id,
          context: context,
          nameRoute: HomeModule.commentsPage,
        ),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shadowColor: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _post.title ?? "Título",
                    style: ApplicationThemes.quickSandBold,
                  ),
                ),
                TextSimpleBody(text: _post.body ?? "Body"),
                TextSimpleBody(
                  text: _post.id == null ? "" : _post.id.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
