import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:physicians_map/src/api_helper/api_helper.dart';
import 'package:physicians_map/src/globals.dart';
import 'package:physicians_map/src/home/posts/posts/model/post_model.dart';

part './posts_events.dart';
part './posts_states.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsLoading()) {
    on<PostsStartedEvent>(_onStarted);
    on<AddedToPostsEvent>(_onPostAdded);
    on<RemovedFromPostsEvent>(_onPostRemoved);
  }

  Future<List<PostModel>> _getPosts() async {
    // await Future.delayed(const Duration(seconds: 2));
    Uri uri = APIHelper.getPosts;
    try {
      return await get(uri, headers: {"x-access-token": accessToken ?? ""})
          .then((value) {
        logger.d(value.body);
        logger.d(value.body.runtimeType);
        logger.d(json.decode(value.body).runtimeType);
        List responseBody = json.decode(value.body);
        List<PostModel> posts = [];
        for (var value in responseBody) {
          posts.add(PostModel.fromMap(value));
        }
        return posts;
      });
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  void _onStarted(PostsStartedEvent event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      final posts = await _getPosts();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      emit(PostsError());
    }
  }

  void _onPostAdded(AddedToPostsEvent event, Emitter<PostsState> emit) {
    emit(PostsLoading());
  }

  void _onPostRemoved(RemovedFromPostsEvent event, Emitter<PostsState> emit) {
    emit(PostsLoading());
  }
}
