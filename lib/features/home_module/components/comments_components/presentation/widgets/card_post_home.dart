import 'package:challenge_application/application/application_themes.dart';
import 'package:challenge_application/core/commons/mg_text_simple_body.dart';
import 'package:challenge_application/features/home_module/use_cases/get_comments_case/input_output/get_comments_use_case_output.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final GetCommentsOutput _comment;

  const CommentCard({
    super.key,
    required GetCommentsOutput comment,
  }) : _comment = comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Card(
          color: Colors.orange[100],
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
                  child: Text(_comment.name ?? "Name",
                      style: ApplicationThemes.quickSandBold),
                ),
                TextSimpleBody(
                  text: _comment.body ?? "Contenido",
                ),
                TextSimpleBody(
                  text: _comment.email ?? "Email",
                ),
                TextSimpleBody(
                  text: _comment.id == null ? "" : _comment.id.toString(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
