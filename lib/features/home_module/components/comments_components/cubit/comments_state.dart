import 'package:challenge_application/core/entities/comment_entitie.dart';
import 'package:challenge_application/core/entities/error_entitie.dart';
import 'package:equatable/equatable.dart';

class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object?> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsNoInternet extends CommentsState {}

class CommentsError extends CommentsState {
  final ErrorMenssage? error;
  const CommentsError({this.error});
  @override
  List<Object?> get props => [error];
}

class CommentsLoaded extends CommentsState {
  final CommentEntitie? comments;
  const CommentsLoaded({this.comments});
  @override
  List<Object?> get props => [comments];
}
