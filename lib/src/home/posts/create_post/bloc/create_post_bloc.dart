import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:physicians_map/src/api_helper/api_helper.dart';
import 'package:physicians_map/src/globals.dart';
import 'package:physicians_map/src/home/posts/create_post/bloc/create_post_events.dart';
import 'package:physicians_map/src/home/posts/create_post/bloc/create_post_states.dart';
import 'package:physicians_map/src/home/posts/posts/model/post_model.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  CreatePostBloc(CreatePostState initialState) : super(initialState);

  Future<void> createPost() async {
    Uri uri = APIHelper.createPost;
    PostModel postModel = const PostModel(title: "any");
    post(uri,
            body: postModel.toJson(),
            headers: {"x-access-token": accessToken ?? ""})
        .then((value) => print(value.body));
  }
}
