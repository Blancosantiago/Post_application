import 'package:challenge_application/core/entities/post_entitie.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeNoInternet extends HomeState {}

class HomeError extends HomeState {
  final String? error;
  const HomeError({this.error});
  @override
  List<Object?> get props => [error];
}

class HomeLoaded extends HomeState {
  final PostEntitie? postList;
  const HomeLoaded({this.postList});
  @override
  List<Object?> get props => [postList];
}
