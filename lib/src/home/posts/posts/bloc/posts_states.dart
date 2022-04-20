part of './posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

class PostsLoading extends PostsState {
  @override
  List<Object?> get props => [];
}

class PostsLoaded extends PostsState {
  final List<PostModel> posts;
  const PostsLoaded({required this.posts});
  @override
  List<Object?> get props => [];
}

class PostsError extends PostsState {
  @override
  List<Object?> get props => [];
}
