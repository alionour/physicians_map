part of './posts_bloc.dart';

// The event which [PostsBloc] will react to
abstract class PostsEvent extends Equatable {}

class PostsStartedEvent implements PostsEvent {
  @override
  List<Object?> get props => [];
  @override
  bool? get stringify => true;
}

class AddedToPostsEvent implements PostsEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class RemovedFromPostsEvent implements PostsEvent {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
